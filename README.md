# PRODIGY_AD_02 

# Listify - TODO List App in Flutter

A Flutter-based Todo List application that allows users to manage their tasks efficiently. Users can add, update, delete tasks, and set priorities with date and time settings. The app features a user-friendly interface and utilizes the `intl` package for formatting dates and times.

## Screenshots and Explore [Tap here!](https://todolist-flutter.netlify.app/)

![image](https://github.com/user-attachments/assets/6fe1d754-a4bf-47c9-a4ba-8db844ab879c)

# Demo [Tap here!](https://todolist-flutter.netlify.app/) 

When using a browser’s **Inspect** tool to view a website in **Phone mode** (mobile view), follow these steps:

1. **Right Click** on the webpage.
2. Select **Inspect** (or press `Ctrl + Shift + I` on Windows/Linux or `Cmd + Option + I` on macOS).
3. Once the developer tools open, locate the **device toolbar** icon at the top of the dev tools panel. It looks like a small phone and tablet symbol.
4. Click on the icon to toggle **Phone mode** (also known as **Responsive Design Mode**).
5. You can now view the site as it would appear on a phone or tablet. There is an option to select different devices from the dropdown at the top to simulate screen sizes, such as iPhone, Pixel, Galaxy, etc.

## Features

- **Add Tasks**: Users can create new tasks with a title, description, priority level (low, medium, high), and due date/time.
- **Update Tasks**: Edit existing tasks to modify their details or change the priority and due date/time.
- **Delete Tasks**: Remove tasks that have been completed or are no longer needed.
- **Priority Levels**: Set priority levels for tasks to help users focus on what’s important.
- **Date and Time Setting**: Users can specify a due date and time for their tasks.
- **User-Friendly UI**: Designed with simplicity and ease of use in mind.
- **Internationalization**: Utilizes the `intl` package for date and time formatting to support multiple locales.

## Installation

1. Clone the repository:

   ```bash
   git clone https://github.com/yourusername/todo_list_app.git
   ```

2. Navigate to the project directory:

   ```bash
   cd todo_list_app
   ```

3. Install dependencies:

   ```bash
   flutter pub get
   ```

4. Run the application:

   ```bash
   flutter run
   ```

## Usage

1. **Adding a Task**: Click on the "Add Task" button, fill in the details, and select a priority level and due date/time. Press "Save" to add the task to your list.
2. **Updating a Task**: Tap on a task to view its details, then select the "Edit" option. Modify the task information and save your changes.
3. **Deleting a Task**: Swipe left on the task in the list or select the delete option in the task details view to remove it from the list.
4. **Viewing Tasks**: Tasks are displayed in a list format, categorized by priority and due date/time.

## Dependencies

- `flutter`: ^x.x.x
- `intl`: ^x.x.x

## Acknowledgments

- [Flutter](https://flutter.dev/) - The framework used for building the app.
- [intl](https://pub.dev/packages/intl) - Package used for date and time formatting.
