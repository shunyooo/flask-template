from flask import jsonify, make_response

# レスポンス系
def make_json_response(res_dict):
  res = make_response(jsonify(res_dict))
  res.headers['Access-Control-Allow-Origin'] = '*'
  return res
