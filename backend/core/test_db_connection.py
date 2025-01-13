import os
import psycopg2
from dotenv import load_dotenv
from pathlib import Path
from django.http import JsonResponse
from django.db import connection

# Load environment variables
env_path = Path(__file__).resolve().parent.parent.parent / '.env'
load_dotenv(dotenv_path=env_path)

# # Get database connection details from environment variables
# dbname = os.getenv('VITE_SUPABASE_DB_NAME')
# user = os.getenv('VITE_SUPABASE_DB_USER')
# password = os.getenv('VITE_SUPABASE_DB_PASSWORD')
# host = os.getenv('VITE_SUPABASE_DB_HOST')
# port = os.getenv('VITE_SUPABASE_DB_PORT', '5432')

# # Print the loaded environment variables for debugging
# print(f"DB Name: {dbname}")
# print(f"User: {user}")
# print(f"Password: {password}")
# print(f"Host: {host}")
# print(f"Port: {port}")

# # Connect to the database
# connection = None
# try:
#     connection = psycopg2.connect(
#         dbname=dbname,
#         user=user,
#         password=password,
#         host=host,
#         port=port
#     )
#     cursor = connection.cursor()
#     cursor.execute("SELECT 1;")
#     print("Connection successful!")
# except Exception as e:
#     print(f"Connection failed: {e}")
# finally:
#     if connection:
#         cursor.close()
#         connection.close()

def test_database_connection(request):
    try:
        with connection.cursor() as cursor:
            cursor.execute("SELECT 1;")  # Simple query to test connection
            result = cursor.fetchone()
        return JsonResponse({"status": "success", "result": result})
    except Exception as e:
        return JsonResponse({"status": "error", "message": str(e)})