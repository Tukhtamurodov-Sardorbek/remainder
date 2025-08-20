abstract class BackendServices {
  Future<void> init();
}

/*
Build (Development & Data Services)
- App Check — Protect backend resources from abuse by ensuring requests come from your authentic app.
- Authentication — Easy multi-platform user sign-in (email/password, OAuth, phone, etc.).
- Cloud Firestore — Scalable NoSQL document database for real-time syncing.
- Realtime Database — Cloud-hosted NoSQL database that syncs data in real time.
- Cloud Storage — Store and serve user-generated content such as images or videos.
- Cloud Functions — Run backend code without managing servers; triggered by events (database changes, auth state, etc.).
- App Hosting — Deploy and host web apps with global CDN, SSL, and versioning.
- Data Connect & Extensions — Pre-packaged back-end automations and integrations.
- Firebase ML / AI — Machine learning capabilities on-device or in the cloud; includes ML Kit and AI Logic SDKs.

Run (Optimization, Delivery & Insights)
- Crashlytics — Real-time crash reporting to identify, prioritize, and fix stability issues.
- Remote Config — Dynamically update app behavior and UI without releasing a new version; supports feature flags and rollouts.
- Google Analytics — Track user behavior, acquisition, and in-app events for data-driven decisions.

- A/B Testing — Run experiments and optimize features using Remote Config and Analytics.
- App Distribution — Manage beta releases to testers and gain feedback.
- Cloud Messaging (FCM) — Send push notifications and messages across platforms (Android, iOS, web).
- Performance Monitoring — Measure app performance metrics (startup time, API latency) and improve UX.
- In-App Messaging — Send targeted messages to users while they interact with your app.
- Test Lab — Cloud-based infrastructure for automated testing on real devices.
 */