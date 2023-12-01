import * as functions from "firebase-functions";
import * as admin from "firebase-admin";

admin.initializeApp();

export const onVideoCreated = functions.firestore
  .document("videos/{videoId}")
  .onCreate(async (snap, context) => {
    await snap.ref.update({ hello: "world" });
  });
