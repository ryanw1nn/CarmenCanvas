# Changes Since Presenting Wed 4/17

## User Updates

updated user model to include password functionality. This required us to also update how we implemented the admin user, and the ability to add or create new users. When adding new users, it now creates a default password as ```cse3901!```. This was done with the addition of the bcrypt gem.

## Admin View

We tried to fix the checkmark ability to allow a user to be admin, however debugging was quite an issue as our JavaScript wasn't working well with this to display the checked box properly. So we opted out of the checkbox feature and just displayed true false values. We also removed the ability to delete an admin user as this is unsafe.

## CarmenCritic Presentation

We created an initial presentation that the Grader can use to see how a presentation event will be formatted and how it looks when associated with users and has comments.
