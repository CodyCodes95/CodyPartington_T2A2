**R7. Identification of the problem you are trying to solve by building this particular marketplace app.**

Many online marketplaces facilitate the buying and selling of cars. These fill the needs of most buyers and sellers. Being someone who has a passion for modified cars and having gone through the process of selling modified cars on these platforms multiple times, it is clear that the platforms available do not cater well to specialised vehicles.

Although I understand it may not make sense for existing marketplace apps such as Carsales to focus on catering to modified car buyers and sellers as they make up a tiny percentage of the overall used car market, there is space in the market for an app to serve the needs of these people.

**R8. Why is it a problem that needs solving?**

It is hard for a buyer interested in buying a modified car to find what you're looking for on a regular car marketplace. As a seller using these platforms, it's impossible to have your listing targeted to a buyer who would be interested in a modified vehicle. It is for this reason that a minimal amount of modified car sales take place on popular marketplaces such as Carsales.

Instead, most modified car sales take place inside particular Facebook groups set up to buy and sell modified cars. While this has a one-up on a website such as Carsales in terms of targeting the listings to the right people, this platform lacks in the listings being tailored to cars. Sale posts are often a giant wall of text on a Facebook post with some photos. The listing structure is not tailored to vehicles as it's just using the Facebook format. 

My marketplace app is called Modified Rides. It provides a much better experience to both buyers and sellers of modified cars, by providing targeted listings for sellers with attributes focused on modifications and allowing buyers to find exactly what they're looking for.

**R9. A link (URL) to your deployed app (i.e. website)**

https://modified-rides.herokuapp.com/

**R10. A link to your GitHub repository (repo).**

https://github.com/CodyCodes95/CodyPartington_T2A2

**R11. Description of your marketplace app (website), including:**

**Purpose**

The purpose of my marketplace app is to facilitate the discovery, buying and selling of modified cars, and give users all the functionality they need to either buy or sell a modified car.

**Functionality / features**

<ul>
<li>Registered users are able to create a profile with their personal information, with the option to attach an avatar.</li>

<li>Users can create, update and destroy a listing once a profile has been created. </li>

<li>Ability to search through listings with filters such as make, model, price, location, and modifications.</li>

<li>Functionality to start a chat with a seller of a car and send an offer</li>

<li>Ability for a seller to reject an offer. If a seller rejects an offer, the buyer is notified that the offer has been rejected and is free to give another offer.</li>

<li>Ability for the seller to accept an offer, which delists the car and adds it to the buyer's orders as a purchase, and the seller's orders as a sale</li>

<li>Ability to attach image to chat messages</li>

<li>Users can view their previous purchases/sales</li>

<li>Site administrators have access to an admin dashboard which delivers a nice GUI for CRUD of all entities and can also create other site admins through this dashboard</li>
</ul>

**Sitemap**

Located at /docs/sitemap.xml 

**Screenshots**

**Target audience**
<ul>
<li>Buyers interested in purchasing a modified car.</li>
<li>Sellers of modified cars.</li>
</ul>

**Tech stack (e.g. html, css, deployment platform, etc)**

<ul>
<li>Ruby on Rails</li>
<li>PostgreSQL - Database</li>
<li>Bootstrap - styling</li>
<li>Heroku - Deployment</li>
</ul>

**R12. User stories for your app**

https://github.com/CodyCodes95/CodyPartington_T2A2/projects/2

**R13. Wireframes for your app**

located at /docs/modified-rides-wireframes (PDF and Balsamic file)

**R14. An ERD for your app**

![url](/docs/modified-rides-erd.png)

**R15. Explain the different high-level components (abstractions) in your app**

The models in the application are:

<ul>
<li>Address</li>
<li>Car</li>
<li>Chat</li>
<li>Listing_Modifications(Join table)</li>
<li>Listing</li>
<li>Message</li>
<li>Modification</li>
<li>Profile</li>
<li>Purchase</li>
<li>Role(Rolify)</li>
<li>User(Devise)</li>
<li>Watch_List</li>
</ul>

The views and controllers in the application are:

<ul>
<li>Admins</li>
<li>Chats</li>
<li>Listings</li>
<li>Profiles</li>
<li>Purchases</li>
<li>Watch Lists</li>
</ul>

The majority of the app is mainly centred around the listings and profiles models. Many other models are associated with the listings and the people buying and selling them (profiles) as they are the core of the application. 

As Devise is used to handle user registrations, a user's profile is abstracted away into its own entity. Devise has pre-built controllers and views that handle the creation of user accounts.

The profile model holds the information required for a profile to be created. The address is abstracted into its own entity. Upon creation of a user, a profile must be made, as the application expects created listings to be tied to a profile, not a user. As soon as a user is created, they are redirected to the new profile page, which starts the new action in the profiles controller. This starts the process of building a profile in the form on the view, where the user can then enter their personal details for their profile. Once the form is submitted, the profile create action runs from the profiles controller, which references the validations in the model to ensure the data is what is expected, and if so are redirected to the listings page.

The listing model holds most of the required data for a listing. The car make, and model is abstracted into its own entity, which the listing references. This is so that there can be multiple cars listed with the same make and model without duplicate tuples. The same process is applied to modifications, which listings references through a listing_modifications join table. Once again, this is to allow there to be many listings with the same modifications and no duplicate data. A listing also references ActiveStorage to retrieve attachment images for any particular listing.

The listing controller handles all CRUD aspects of a listing, including the creation of modifications and cars within the database. When creating a listing, the *new* action is called in the listings controller which starts the build process for the listing, car and modifications. This allows the create listing form to be submitted, which takes that information and creates the final listing with the create method. The controller is responsible for passing through all the required attributes from listings and other relations to the view for viewing back created listings in both the show page and the index pages. The listings controller also handles the search and filtering logic for the view.

The chat controller is what the app uses to create a conversation between a buyer and seller. On the listing view, there is a make enquiry button, which sends the parameters of the listing, and who the person (buyer) who clicked the button was through to the chat controller, where the chat is then created. Messages are also created in the chat controller, despite being abstracted away into a separate model. The chat view shows the form to the user where the message content, including attachments, can be entered and sent for creation.

The purchase model is designed to hold a record of all listings which have been purchased through the application. A purchase is created once an offer in a chat has been accepted. The view of the chat has an accept offer button which sends through the parameters of the car sold, buyer, seller and the price to the purchases controller, where the purchase is then created and the listing removed.

The watch list entity creates a watch list item and links it to the profile ID of who is watching it and the listing ID of which listing is being watched.

**R16. Detail any third party services that your app will use**

<ul>
<li>Cloudinary is utilised for the upload of images for car listings, user avatars, and attachments in chat messages. Cloudinary also manages compression of the images and returning the correct sizes depending on the view.</li>

<li>Heroku is utilised for hosting the deployed application. Heroku also stores the Postgres Database used.</li>

</ul>

**R17. Describe your projects models in terms of the relationships (active record associations) they have with each other**

Each model in the application has a number of relationships used to ensure that each model that is related to one another can access the relevant information that it needs to function from another model. Looking at our *listings* and *profiles* models as examples, as they are what most of the application revolves around, and a lot of other models are dependant on them. A listing *belongs to* a profile, and a profile *has many* listings. 

The *belongs to* relationship being applied to listing in relation to a profile allows for a few things. Firstly it ensures that a listing cannot be created without a profile. That is, a car listing must be posted by someone. It would make no sense for a listing to be published by no one, so this relationship must exist. With this relationship being declared, at the time of a creation of a listing, the profile ID must be provided as a mandatory field, which allows for the correct association between profile and listing to be made. This relationship also allows Active Record to access the profile of any given listing. If we want to find who the profile was for any given listing, this relationship allows us to get that information.

The *has many* relationships being applied to profile in relation to listings also allow for certain functionality. Unlike a *belongs to* relationship, a listing is not a mandatory field in order for a profile to be created. This makes sense because a profile does not *need* to have a listing to exist, unlike a listing needing a profile. Users are welcome to use a profile to simply browse or buy cars, and creating a listing at the time of creating a profile is not necessary. Similar to the *belongs to* relationship, *has many* gives us access to all the listings of any given profile.

The *has many through* relationship is utilised between our listing and modification models. This relationship is used in Active Record to represent a many to many relationship. The has many through relationship takes our models, which have a many to many relationship (listings, modifications) and connect them to a joining table calling Listing_modifications. As many cars share the same modifications, this relationship is used to avoid duplicate data for modifications when more than one listing shares a modification.

The *has one attached* and *has many attached* relationship is utilised between some of our models as well. Looking at listings as an example,  a *has many attached :car_images* association allows us to pass one or more files through as *car_images*, where rails will then know to use Active Storage to store the files wherever specified (in our case, Cloudinary) and associate that image or images with that listing. This association allows us to find any *car images* associated with a particular listing.

**R18. Discuss the database relations to be implemented in your application**

Several relations are used in the database for the application to ensure the integrity and correct referencing between entities. One of these is a *one to many* relation. As seen in our ERD, the relation between Chats and Messages is an example of a *one to many* relation. A chat can have multiple messages, and each message must have one chat. This is a one to many relationship, one chat to many messages. The entities make this relation by referencing a foreign key between the tables. Since a message needs a chat to exist, each message references the chat ID as a foreign key. 

An example of a *one to one* relation which can be seen in our ERD is our Users and Profiles. A user has one profile, and a profile must have one user. Once again, a foreign key is used here in the Profiles table to reference the user that the profile belongs to.

Although it may not look like in from the ERD, our Listings and Modifications have a *many to many* relationship. Although this is true, we represent this by both Listings and Modifications having a *one to many* relation with a joining table called Lisitng_modifications. Each tuple of this join table references both the listing ID and the modification ID to create the *many to many* relation.

**R19. Provide your database schema design**

![url](/docs/modified-rides-erd.png)

**R20. Describe the way tasks are allocated and tracked in your project**

The Agile philosophy was applied to the development of this project. Tasks were mainly tracked by first developing user stories for features and then translating those stories into separate task cards using Github Kanban Project Board. Each card contained multiple actions that needed to be completed for the user story to be satisfied. User stories were acted upon quickly, and features were deployed quickly. I also participated in daily stand-ups, which helped me further reflect on the work completed of the previous day and reaffirmed what I would be working on for the day to come.