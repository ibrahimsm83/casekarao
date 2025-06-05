# casekarao

#FigmaLink:
https://www.figma.com/design/h2ApMIFqDvnDxCyLvSxVdF/CaseKarao-Mobile-App?node-id=6-771&t=QcBLU3BnparqBa2E-0

## Flutter Version:
3.29.0


Summary of the Network Manager Implementation
I've created a comprehensive network management solution for your Flutter application using Dio. Here's a summary of what I've implemented:

1. Core Network Components
NetworkManager ( lib/core/network/network_manager.dart)
Singleton class for handling all network operations
Configures Dio with base URL, timeouts, and headers
Implements interceptors for logging and authentication
Provides methods for all HTTP methods (GET, POST, PUT, DELETE)
Supports multipart requests for file uploads
Handles error responses with appropriate error messages
Manages authentication tokens using SharedPreferences
ApiResponse ( lib/core/network/api_response.dart)
Generic class to represent API responses
Includes status (INITIAL, LOADING, COMPLETED, ERROR)
Contains data, message, and status code
ApiException ( lib/core/network/api_exception.dart)
Custom exception classes for different types of errors
Includes specific exceptions for common HTTP errors
ApiService ( lib/core/network/api_service.dart)
Wrapper around NetworkManager for easier usage
Provides simplified methods for API calls
Includes helper methods for file uploads
2. Models and Repositories
AuthUserModel ( lib/model/auth_user_model.dart)
Model class for user authentication data
Includes fromJson and toJson methods
AuthRepository ( lib/repository/auth_repository.dart)
Repository class for authentication-related API calls
Uses ApiService to make network requests
Implements methods for login, register, logout, etc.
3. Controller
AuthController ( lib/controller/auth_controller.dart)
GetX controller for managing authentication state
Uses AuthRepository to make API calls
Provides reactive state management with Rx variables
Implements methods for all authentication operations
4. Example Usage
ExampleNetworkUsageScreen ( lib/presentation/example_network_usage_screen.dart)
Example screen showing how to use the AuthController
Demonstrates reactive UI updates based on API response status
Key Features
Bearer Token Authentication
Automatically adds Bearer token to all requests
Stores token in SharedPreferences for persistence
Clears token on logout or unauthorized responses
Error Handling
Comprehensive error handling for different HTTP status codes
Custom exception classes for specific error types
Detailed error messages for debugging
Logging
Detailed logging of requests and responses
Uses PrettyDioLogger for formatted console output
Includes request/response headers, body, and status codes
File Uploads
Support for single and multiple file uploads
Progress tracking for uploads
Automatic content type detection based on file extension
Reactive State Management
Uses GetX for reactive state management
Observable API responses for UI updates
Loading states for showing progress indicators


I'll help you create a generalized NetworkManager class using Dio for API calls with all the requirements you've specified. Let's first check if the Dio package is already installed in your project.

I need to add the Dio and shared_preferences packages to the project. Let's install them:

Now, let's create the NetworkManager class. I'll create a comprehensive solution that includes:

1. A NetworkManager class
2. API response models
3. Error handling
4. Token management with shared_preferences
5. Logging for debugging

Let's start by creating the necessary files:

Now, let's create a helper class to make it easier to use the NetworkManager:

Let's create an export file to make it easier to import these classes:

Now, let's create a simple example of how to use this NetworkManager with a model class:

Let's check the existing user model:

Let's create a different model for our example:

Finally, let's create an example repository to demonstrate how to use the NetworkManager:

Now, let's create an example of how to use this repository in a controller:

Finally, let's create a simple example of how to use this controller in a screen:

Now, let's update the `export_casekarao.dart` file to include our network module:

Let's also update the model export file to include our new auth user model:

remove prefilled value
signin with phone
pop border fix
phone validation
