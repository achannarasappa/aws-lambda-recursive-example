const AWS = require('aws-sdk');
const lambda = new AWS.Lambda();

module.exports.example = ({ callCount = 3 }, context) => {

  console.log('callCount', callCount);

  if (callCount <= 0)
    return console.log('recursive calls finished');

  console.log('recursive call');

  return lambda.invoke({
    FunctionName: context.functionName,
    InvocationType: 'Event',
    Payload: JSON.stringify({ callCount: callCount - 1 }),
  }).promise()
    .then((data) => console.log(data))
    .catch((err) => console.log(err, err.stack))
};