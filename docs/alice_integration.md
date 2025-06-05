# Alice HTTP Inspector Integration

Alice has been successfully integrated into your CaseKarao Flutter project to help with debugging HTTP requests and responses.

## What is Alice?

Alice is a powerful HTTP inspector for Flutter that allows you to:
- Monitor all HTTP requests and responses in real-time
- View request/response headers, body, and timing
- Debug API issues easily
- Export request data for analysis

## How Alice is Integrated

### 1. NetworkManagers Class
Alice is integrated into your `NetworkManagers` class as a Dio interceptor:

```dart
// Alice is initialized in _initializeDio()
alice = Alice(
  showNotification: true,
  showInspectorOnShake: true,
);

// Added as the first interceptor
_dio.interceptors.add(alice.getDioInterceptor());
```

### 2. AliceHelper Class
A helper class provides easy access to Alice throughout your app:

```dart
// Show Alice inspector manually
AliceHelper.showInspector();

// Get Alice instance
Alice aliceInstance = AliceHelper.alice;
```

## How to Use Alice

### Method 1: Shake to Open (Automatic)
- Simply shake your device while the app is running
- Alice inspector will automatically open
- This works on both Android and iOS devices

### Method 2: Manual Trigger
- Tap the floating action button on the Setup Profile screen
- The network inspector icon will open Alice
- You can add similar buttons to other screens as needed

### Method 3: Notification (Automatic)
- Alice shows a notification when HTTP requests are made
- Tap the notification to open the inspector
- This helps you monitor requests in real-time

## What You Can See in Alice

### Request Information:
- HTTP method (GET, POST, PUT, etc.)
- Request URL and headers
- Request body/parameters
- Request timing

### Response Information:
- Response status code
- Response headers
- Response body (JSON, HTML, etc.)
- Response timing and size

### Error Information:
- Failed requests with error details
- Timeout information
- Network connectivity issues

## Example Usage

```dart
// In any widget where you want to show Alice
FloatingActionButton(
  onPressed: () {
    AliceHelper.showInspector();
  },
  child: Icon(Icons.network_check),
  tooltip: 'Show Network Inspector',
)
```

## Benefits for Development

1. **API Debugging**: Easily see what data is being sent/received
2. **Performance Monitoring**: Check request/response times
3. **Error Diagnosis**: Quickly identify failed requests
4. **Data Validation**: Verify API responses match expectations
5. **Testing**: Monitor network behavior during testing

## Production Considerations

Alice is added as a dev dependency, so it won't be included in production builds. However, if you want to explicitly disable it in production:

```dart
// In NetworkManagers._initializeDio()
if (kDebugMode) {
  _dio.interceptors.add(alice.getDioInterceptor());
}
```

## Current Integration Points

- **Setup Profile Screen**: Has a floating action button to open Alice
- **All API Calls**: Automatically monitored through NetworkManagers
- **Real-time Monitoring**: Shake device or tap notification to view

## Next Steps

You can add Alice access buttons to other screens where you frequently test API calls, or rely on the shake gesture and notifications for automatic access.
