import os
import json
import logging
import azure.functions as func
from azure.servicebus import ServiceBusClient, ServiceBusMessage

SERVICE_BUS_CONNECTION = os.getenv("ServiceBusConnection")
SERVICE_BUS_QUEUE_NAME = os.getenv("ServiceBusQueueName", "fileprocessing")


def main(event: func.EventGridEvent):
    logging.info("Function triggered by Event Grid event")

    event_data = event.get_json()
    logging.debug("Event data: %s", json.dumps(event_data))

    blob_url = event_data.get("data", {}).get("url")
    blob_name = event_data.get("data", {}).get("url", "").split("/")[-1]
    event_type = event.event_type

    message_payload = {
        "blobUrl": blob_url,
        "blobName": blob_name,
        "eventType": event_type,
        "data": event_data.get("data", {})
    }

    if not SERVICE_BUS_CONNECTION:
        logging.error("ServiceBusConnection is not configured.")
        raise ValueError("ServiceBusConnection is required")

    try:
        with ServiceBusClient.from_connection_string(SERVICE_BUS_CONNECTION) as client:
            sender = client.get_queue_sender(queue_name=SERVICE_BUS_QUEUE_NAME)
            with sender:
                message = ServiceBusMessage(json.dumps(message_payload))
                sender.send_messages(message)
                logging.info("Published message to Service Bus queue '%s'", SERVICE_BUS_QUEUE_NAME)
    except Exception as e:
        logging.error("Failed to publish message: %s", str(e))
        raise
