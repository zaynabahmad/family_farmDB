import pymysql
import json 

# connect to specific database 
def get_db_connection(host, user, password, database):
    connection = pymysql.connect(
        host=host,  # the ip fo the server or the endpoint of the rds 
        user=user,
        password=password,
        database=database,
        cursorclass=pymysql.cursors.DictCursor  
    )

    return connection

def lambda_handler(event, context):
    try:
        host = event['DB_HOST']
        user = event['DB_USER']
        password = event['DB_PASSWORD']
        database = event['DB_NAME']
        
        connection = get_db_connection(host, user, password, database)

        query = "SELECT * FROM your_table_name"  
        result_set = connection.execute(query)
        
        results = [row for row in result_set]
        
        connection.close()
        
        return {
            'statusCode': 200,
            'body': json.dumps(results)
        }

    # error 
    except Exception as e:
        return {
            'statusCode': 500,
            'body': json.dumps({'error': str(e)})
        }
