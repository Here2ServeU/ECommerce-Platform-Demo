const AWS = require('aws-sdk');
const uuid = require('uuid');

const dynamoDB = new AWS.DynamoDB.DocumentClient();

exports.handler = async (event) => {
    const body = JSON.parse(event.body);
    const { service, first_name, last_name, phone, email, address } = body;

    const id = uuid.v4();
    const params = {
        TableName: process.env.DYNAMODB_TABLE,
        Item: {
            id,
            service,
            first_name,
            last_name,
            phone,
            email,
            address,
            submitted_at: new Date().toISOString(),
        },
    };

    try {
        await dynamoDB.put(params).promise();
        return {
            statusCode: 200,
            body: JSON.stringify({ message: "Form submission successful!" }),
        };
    } catch (error) {
        console.error(error);
        return {
            statusCode: 500,
            body: JSON.stringify({ error: "Could not save form submission" }),
        };
    }
};
