#!/bin/sh

set -e
set -x

if [ -z "$INPUT_DESTINATION_URL" ]
then
  echo "url must be defined"
  return -1
fi

URL=$INPUT_DESTINATION_URL/api/v2/import-scan/
echo $URL
FILE=@"/$INPUT_FILE"
echo $FILE
KEY="Token $INPUT_API_V2_KEY"

echo "curl --location --request POST '$URL' \
--header 'accept: application/json' \
--header 'Content-Type: multipart/form-data' \
--header 'Authorization: $KEY' \
--form 'test_title=$INPUT_TEST_TITLE' \
--form 'tags=$INPUT_TAGS' \
--form 'product_name=$INPUT_PRODUCT_NAME' \
--form 'file=$FILE' \
--form 'scan_type=$INPUT_SCAN_TYPE' \
--form 'engagement=$INPUT_ENGAGEMENT'"

curl --location --request POST "$URL" \
--header "accept: application/json" \
--header "Content-Type: multipart/form-data" \
--header "Authorization: $KEY" \
--form "test_title=$INPUT_TEST_TITLE" \
--form "tags=$INPUT_TAGS" \
--form "product_name=$INPUT_PRODUCT_NAME" \
--form "file=$FILE" \
--form "scan_type=$INPUT_SCAN_TYPE" \
--form "engagement=$INPUT_ENGAGEMENT"