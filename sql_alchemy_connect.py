import json
from sqlalchemy import create_engine

def get_db_connection(host , user , password , database ):
    host = host 
    user = user
    password = password
    database = database 
    
    db_url = f"mysql+pymysql://{user}:{password}@{host}/{database}"
    
    engine = create_engine(db_url)
    
    return engine.connect()

def lambda_handler(event, context):
    try:
        connection = get_db_connection()

        return {
            'statusCode': 200,
            'body': json.dumps(connection)
        }

    except Exception as e:
        return {
            'statusCode': 500,
            'body': json.dumps({'error': str(e)})
        }
