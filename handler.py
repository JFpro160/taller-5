import os
import boto3
import requests
import json
from botocore.exceptions import ClientError

def get_secret_from_lambda(event, context):
    secret_name = os.environ['SECRET_NAME']
    region_name = "us-east-1"

    client = boto3.client('secretsmanager', region_name=region_name)

    try:
        get_secret_value_response = client.get_secret_value(SecretId=secret_name)
    except ClientError as e:
        print(f"Error al obtener el secreto: {e}")
        raise e

    secret = get_secret_value_response['SecretString']
    secret_dict = json.loads(secret)
    api_key = secret_dict['api_key']

    api_url = "https://{apiId}.execute-api.us-east-1.amazonaws.com/dev"  # Cambiar {apiId} por el ID de la API
    headers = {
        "x-api-key": api_key
    }

    response = requests.get(api_url, headers=headers)

    return {
        'statusCode': 200,
        'body': response.text
    }

