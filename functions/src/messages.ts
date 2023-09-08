const { onCall } = require("firebase-functions/v2/https");

const {initializeApp} = require("firebase-admin/app");
const {getFirestore} = require("firebase-admin/firestore");

const messageCollection = "messages";

initializeApp();
/* //removed, because 2ndGen has no eventId to make calls idempotent
exports.sendmessage = onCall({ concurrency: 20 }, async (request : any) => {

    console.log("ALIVE");
    const eventId = request.context.eventId;
    console.log(`ALIVE ${eventId}`);

    const message = request.data.message;
    //const uid = request.auth.uid;
    const name = request.auth.token.name || null;
    const validated = name != null;

    message.author = name;
    message.validated = validated;

    await getFirestore().collection(messageCollection).doc().set(message);


    return "Hello, world!";
  }
);
*/