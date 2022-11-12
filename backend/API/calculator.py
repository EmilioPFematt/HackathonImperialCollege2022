import json
from flask import (
    Blueprint, jsonify, make_response, flash, g, redirect, render_template, request, session, url_for
)
from werkzeug.security import check_password_hash, generate_password_hash

from API.db import get_db

bp = Blueprint('auth', __name__, url_prefix='/calc')

def mysql_read_where(table_name, d_where):
    db = get_db()
    cursor = db.cursor()
    read = 'SELECT * FROM %s WHERE (' % table_name
    #print(read)
    try:
        for k,v in d_where.items():
            if v is not None:
                if isinstance(v, bool):
                    v = int(v == True)
                    read += '%s = "%s" AND ' % (k,v)
                elif isinstance(v, str):
                    if '"' in v:
                        read+= '%s = "%s" AND ' % (k, v)
                    else :
                        read += '%s = "%s" AND ' % (k,v)
                else:
                    read += '%s = "%s" AND ' % (k,v)
            else :
                read += '%s is NULL AND ' % (k)
        read = read[:-4]
        read+=')'
        #print(read)
        cursor.execute(read)
        a = cursor.fetchall()
        return json.dumps([dict(i) for i in a])
    except Exception as e:
        raise TypeError("mysql_read_where:%s" % e)


@bp.route('', methods = ['GET'])
def calc():
    p_name = request.args.get('name')
    try: 
        d_product = mysql_read_where('product', {'name':p_name})
        #print(d_product)
        return make_response(d_product)
    except:
        return make_response("Error", 500)


