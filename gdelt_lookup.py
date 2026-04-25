"""Small example script for querying the GDELT DOC API."""

import json
import requests

BASE_URL = "https://api.gdeltproject.org/api/v2/doc/doc"

# Function to query GDELT with a given search query and return the JSON response
def query_gdelt(query):
    """Send one query to GDELT and return the JSON response."""
    params = {
        "query": query,
        "mode": "artlist",
        "format": "json",
        "maxrecords": 5,
        "timespan": "24H",
        "sort": "hybridrelevance",
        "language": "english"
    }

    response = requests.get(BASE_URL, params=params, timeout=30)
    response.raise_for_status()
    return response.json()