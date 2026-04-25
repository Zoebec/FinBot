### Description: Main script to start the FinBot application. This will initialize the various components and start the main loop.
from gdelt_lookup import query_gdelt
from ollama import chat, ChatResponse


# Testing start of Ollama instance and querying a model
response: ChatResponse = chat(model='llama3.1', messages=[
  {
    'role': 'user',
    'content': 'Why is the sky blue?',
  },
])
print(response['message']['content'])
# or access fields directly from the response object
print(response.message.content)