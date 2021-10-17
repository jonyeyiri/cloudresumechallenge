import logging

import azure.functions as func
from azure.cosmos import exceptions, CosmosClient, PartitionKey

def main(req: func.HttpRequest, inputDocument: func.DocumentList, outputDoc: func.Out[func.Document]) -> func.HttpResponse:
    logging.info('Python HTTP trigger function processed a request.')

    Counter = getNewCounterValue(inputDocument[0]['count']) #+ 1
    inputDocument[0]['count'] = Counter
    outputDoc.set(func.Document.from_json(inputDocument[0].to_json()))
    if Counter:
        return func.HttpResponse(f"{Counter}", status_code=200)
    else:
        return func.HttpResponse(
             "Error",
             status_code=500
        )

def getNewCounterValue(value: int):
    return value + 1
