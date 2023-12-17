// index.js

exports.handler = async (event) => {
    return {
      statusCode: 200,
      body: JSON.stringify('Hello!! You are connecting to a lambda function'),
    };
  };
  