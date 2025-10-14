import json
from google.cloud import storage

def process_file(event, context):
    """Triggered by a change to a Cloud Storage bucket.
    Args:
         event (dict): Event payload.
         context (google.cloud.functions.Context): Metadata for the event.
    """
    bucket_name = event['bucket']
    file_name = event['name']

    storage_client = storage.Client()
    input_bucket = storage_client.bucket(bucket_name)
    blob = input_bucket.blob(file_name)
    data = blob.download_as_text()

    # Process the data (count lines or parse JSON)

    line_count = len(data.splitlines())

    output_bucket_name =  storage_client.bucket(f"{bucket_name}-output")
    output_blob = output_bucket_name.blob(f"processed_{file_name}")
    output_blob.upload_from_string(json.dumps({"lines": line_count}))

    print(f"Processed file {file_name}, lines: {line_count}")
    