# CarmenCritic

Created by Ryan Winn

## Instructions + Set Up

1. **Clone the Repository**: Clone the repository containing the game code to your local machine.

2. **Install Dependencies**: Run ```bundle```

3. **Run database migrations**: Run ```rails db:migrate```

4. **Seed database**: Run ```rails db:seed```

5. **Open the server**: Run ```rails server```. Server should open at ```http://127.0.0.1:3000/```

6. **Login**: To sign up for first time use, click ```'Sign Up'``` in the top right corner of the site. Create a username, a password and confirm it. You will redirected to the login page where you can log in with your newly created credentials. There also exists a default "admin" user with the username ```admin```. and password ```cse3901!```. Please also use this to access the admin view of our site.

---

## Admin View
In admin view you can see the list of students in a class, and add new ones. The new students you create will have a default password of ```cse3901!``` (same as admin password).

## Notable Gems

- 'bcrypt' : used to hash passwords

## Database Schema

### Table: evaluations

- `id`: Integer (Primary Key)
- `presentation_event_id`: Integer (Foreign Key)
- `score`: Integer
- `comment`: Text
- `created_at`: DateTime
- `updated_at`: DateTime
- `user_id`: Integer (Foreign Key)

### Table: presentation_events

- `id`: Integer (Primary Key)
- `title`: String
- `date`: Date
- `description`: Text
- `created_at`: DateTime
- `updated_at`: DateTime

### Table: presentation_events_users

- `user_id`: Integer (Foreign Key)
- `presentation_event_id`: Integer (Foreign Key)

### Table: users

- `id`: Integer (Primary Key)
- `name`: String
- `admin`: Boolean
- `created_at`: DateTime
- `updated_at`: DateTime
- `password` : String

## Models Overview

### Evaluation Model

- `belongs_to :user`: Defines a one-to-one association with the `User` model, indicating that an evaluation belongs to a user.
- `belongs_to :presentation_event`: Defines a one-to-one association with the `PresentationEvent` model, indicating that an evaluation belongs to a presentation event.

### PresentationEvent Model

- `has_and_belongs_to_many :users, dependent: :destroy`: Defines a many-to-many association with the `User` model, indicating that a presentation event can have multiple users, and vice versa. The `dependent: :destroy` option ensures that associated user records are destroyed if the presentation event is destroyed.
- `has_many :evaluations, dependent: :destroy`: Defines a one-to-many association with the `Evaluation` model, indicating that a presentation event can have multiple evaluations. The `dependent: :destroy` option ensures that associated evaluation records are destroyed if the presentation event is destroyed.

### User Model

- `has_and_belongs_to_many :presentation_events`: Defines a many-to-many association with the `PresentationEvent` model, indicating that a user can participate in multiple presentation events, and vice versa.
- `has_many :evaluations`: Defines a one-to-many association with the `Evaluation` model, indicating that a user can have multiple evaluations.

## Controllers Overview

### ApplicationController

- `before_action :authenticate_user`: Executes the `authenticate_user` method before every action in any controller, ensuring that a user is logged in.
- `helper_method :current_user`: Declares `current_user` as a helper method to be accessible from views.
- `authenticate_user`: Redirects to the login page if no user is logged in.
- `current_user`: Retrieves the currently logged-in user.

### EvaluationsController

- `new`: Initializes a new evaluation for a specific presentation event.
- `create`: Creates a new evaluation for a presentation event with the provided parameters.
- `evaluation_params`: Defines the permitted parameters for evaluation creation.

### PresentationEventsController

- `before_action :set_presentation_event`: Executes the `set_presentation_event` method before specific actions to set the presentation event.
- `index`: Retrieves all presentation events.
- `join`: Allows a user to join a presentation event.
- `leave`: Allows a user to leave a presentation event.
- `show`: Retrieves a specific presentation event.
- `new`: Initializes a new presentation event.
- `edit`: Retrieves a presentation event for editing.
- `create`: Creates a new presentation event.
- `update`: Updates an existing presentation event.
- `destroy`: Destroys a presentation event.
- `index_with_stats`: Retrieves all presentation events with associated evaluations and users for statistical analysis.

### SessionsController

- `skip_before_action :authenticate_user, only: [:new, :create]`: Skips authentication for login and create actions.
- `create`: Authenticates user and sets session if valid credentials provided.
- `destroy`: Logs out the current user and clears the session.

### UsersController

- `create`: Creates a new user with the provided username.
- `destroy`: Deletes a user.
- `update`: Updates user admin status.

## Sources

- [Ruby on Rails Guides](https://guides.rubyonrails.org/): Official Ruby on Rails Documentation
- [MDN Web Docs - JavaScript](https://developer.mozilla.org/en-US/docs/Web/JavaScript): Official documentation for JavaScript provided by Mozilla Developer Network (MDN).
- [MDN Web Docs - CSS](https://developer.mozilla.org/en-US/docs/Web/CSS): Documentation for Cascading Style Sheets (CSS) on MDN Web Docs.
- [Buckeye UX Design System](https://bux.osu.edu/): Colors, Button element, top Nav bar
