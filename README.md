**R7. Identification of the problem you are trying to solve by building this particular marketplace app.**

There are many online marketplaces that facillitate the buying and selling of cars. These fill the needs of most buyers and sellers. Being someone who has a passion for modified cars, and having gone through the process of selling modified cars on these platforms multiple times, it is clear that the platforms available do not cater well to specialized vehicles.

**R8. Why is it a problem that needs solving?**

As a buyer interested in buying a modified car, it is hard to find what you're looking for on a regular car marketplace. As a seller using these platforms it's impossible to have your listing targeted to a buyer who would be interested in a modified vehicle. It is for this reason that a very little amount of modified car sales take place on popular marketplaces such as Carsales.

Rather, most modified car sales take place inside of particular Facebook groups set up for the buying and selling of modified cars. While this has a one up on a website such as Carsales in terms of targeting the listings to the right people, this platforms lacks in the listings being tailored to cars. Sale posts are just often a big wall of text on a Facebook post with some photos. The listing structure is not tailored to cars as it's just using the Facebook format. 

My marketplace app is called Modified Rides, which provides a much better experience to both buyers and sellers of modified cars, by providing targeted listings for sellers with attributes focused on modifications, and allowing buyers to find exactly what they're looking for.

**R9. A link (URL) to your deployed app (i.e. website)**

https://modified-rides.herokuapp.com/

**R10. A link to your GitHub repository (repo).**

https://github.com/CodyCodes95/CodyPartington_T2A2

**R11. Description of your marketplace app (website), including:**

**Purpose**

The purpose of my marketplace app is to faciliate the discovery, buying and selling of modified cars, and give users all the functionality they need to either buy, or sell a modified car.

**Functionality / features**

<ul>
<li>Registered users are able to create a profile with their personal information, with the option to attach an avatar.</li>

<li>Users can create, update and destroy listing once a profile has been created. </li>

<li>Ability to search through liistings with filters such as make, model, price, location, modifications.</li>

<li>Functionality to start a chat with a seller of a car, and send an offer</li>

<li>Ability for seller to reject offer. If a seller rejects an offer, the buyer is notified that the offer has been rejected and is free to give antoher offer.</li>

<li>Ability for seller to accept offer, which delists the car and adds it to the buyers orders as a purchase, and the sellers orders as a sale</li>

<li>Ability to attach image to chat messages</li>

<li>Users can view their previous purchases/sales</li>

<li>Site administrators have access to an admin dashboard which allow a nice GUI for CRUD of all entities, and can also create other site admins through this dashboard</li>
</ul>

**Sitemap**

Located at /src/sitemap.xml 

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

located at /src/modified-rides-wireframes (PDF and Balsamic file)

**R14. An ERD for your app**

![url](/src/modified-rides-erd.png)

**R15. Explain the different high-level components (abstractions) in your app**

The listing entity holds most of the required data for a listing. The car make and model is abstracted into its own entity, which the listing references. This is so that there can be multiple cars listed with the same make and model, without duplicate tuples. The same process is applied to modifications, which listings references through a listing_modifications join table. Once again, this is to allow there to be many listings with the same modifications, and no duplicate data. A listing also references ActiveStorage to retrieve attachment images for any particular listing.

The purchase entity is designed to hold a record of all listings which have been purchased through the application. A purchase references a car as the item purchased, and gets the value of the purchase from the offer that was accepted to create the purchase. A purchase also references a buyer and a seller through the profile entity.

As Devise is used to handle user registrations, a user's profile is abstracted away into its own entity. 

The chat entity is what the app uses to create a conversation between a buyer and seller. A chat references a buyer and seller via a profile ID, and a listing by a listing ID. Messages are abstracted into a separate entity, which contain the content of the message and the sender via a profile ID. A message belongs to the chat which it was created in.

The watch list entity creates a watch list item and links it to the profile ID of who is watching it, and the listing ID of which listing is being watched.

**R16. Detail any third party services that your app will use**

<ul>
<li>Cloudinary is utilised for upload of images for car listings, user avatars, and attachments in chat messages. Cloudinary also manages compression of the images and returning the correct sizes depending on the view.</li>

<li>Heroku is utilised for hosting the deployed application. Heroku also stores the Postgres Database used.</li>

</ul>

**R17. Describe your projects models in terms of the relationships (active record associations) they have with each other**

Each model in the application has a number of relationships used to ensure that each model that is related to one another can access the relevant information that it needs to function from another model. Looking at our *listings* and *profiles* models as examples, as they are what most of the application revolves around, and a lot of other models are dependant on them. A listing *belongs to* a profile, and a profile *has many* listings. 

The *belongs to* relationship being applied to listing in relation to a profile allows for a few things. Firstly it ensures that a listing cannot be created without a profile. That is, a car listing must be posted by someone. It would make no sense for a listing to be posted by no one, so this relationship must exist. With this relationship being declared, at the time of a creation of a listing, the profile ID must be provided as a mandatory field, which allows for the correct association between profile and listing to be made. This relationship also allows Active Record to access the profile of any given listing. If we want to find who the profile was for any given listing, this relationship allows us to get that information.

the *has many* relationship being applied to profile in relation to listings also allow for certain functionality. Unlike a *belongs to* relationship, a listing is not a mandatory field in order for a profile to be created. This makes sense because a profile does not *need* to have a listing to exist, unlike a listing needing a profile. Users are welcome to use a profile to simply browse or buy cars, and creating a listing at the time of creating a profile does is not necessary. Similar to the *belongs to* relationship, *has many* gives us access to all the listings of any given profile.

The *has many through* relationship is utilised between our listing and modification models. This relationship is used in Active Record to represent a many to many relationship. The has many through relationship takes our models which have a many to many relationship (listings, modifications) and connect them to a joining table calling Listing_modifications. As many cars share the same modifications, this relationship is used to avoid duplicate data for modifications when more than one listing shares a modification.

The *has one attached* and *has many attached* relationship is utilised between some of our models as well. Looking at listings as an example,  a *has many attached :car_images* association allows us to pass one or more files through as *car_images*, where rails will then know to use Active Storage to store the files wherever specified (in our case, Cloudinary) and associate that image or images with that listing. This association allows us to find any *car images* associated with a particular listing.

**R18. Discuss the database relations to be implemented in your application**

A number of relations are used in the database for the application, 

**R19. Provide your database schema design**

![url](/src/modified-rides-erd.png)

**R20. Describe the way tasks are allocated and tracked in your project**