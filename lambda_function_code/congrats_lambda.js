// index.js

exports.handler = async (event) => {
    return {
      statusCode: 200,
      body: JSON.stringify('Congratulations!! You have successfully retrieved the success message from lambda'),
    };
  };
  