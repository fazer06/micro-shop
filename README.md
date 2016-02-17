# MicroShop

    This was the additional resources in the building with active record section, because i needed to dive deeper into relationships, its something i've had a hard time getting my head around. 

### http://tutorials.jumpstartlab.com/topics/models/relationships.html

## An example of the relationships ...

- One-to-One   (Customer > Detail)
- One-to-Many  (Customer > Order)
- Many-to-Many (Customer > Subscription > Magazine) - Has Many Through

### On my e-commerce site i have customers, and for each of those customers I want to track information like

- Orders
- Addresses
- First Name
- Last Name
- Birthday
- Gender
- Home City
- Username
- Password
- Email Address

## Database Structure

# The One-to-One Relationship.

### We need to create a one-to-one relationship between a customer and their "details"

## Customer - Parent

- first_name:string 		[present]
- last_name:string  		[present]
- username:string 			[unique, 25  chars max,  present]
- password:string 			[6 chars min, present]
- email_address:string 		[unique, 255 chars max,  present]

- has_one  :detail 			[dependent]
- has_many :orders 			[dependent]
- has_many :subscriptions
- has_many :magazines, through: :subscriptions

The has_one :detail tells Rails to expect a model named Detail that has a foreign key named customer_id
The has_many :orders tells Rails to expect a model named Order that has a foreign key named customer_id

## Detail - Child 			[index customer_id]

- birthday:string 			[present]
- gender:string 			[present]
- city:string 				[present]
- customer_id:integer 		[present]

- belongs_to :customer

# The One-to-Many Relationship.

### We need to create a one-to-many relationship between a customer and their "orders"

## Order - Child			[index customer_id]

- customer_id:integer 		[present]

- belongs_to :customer

# Extra Info

## belongs_to

    The belongs_to :customer tells Rails that customer_id points to the ID field of a class named Customer or the table named customers. It's the "child" record that holds a foreign key pointing back to the "parent"

## Building Child Objects

    When you create a Customer it won’t have any child Order objects. Here are three ways to create one, assuming we have a customer object:

    Order.new(customer_id: customer.id) – least preferred. It has no future flexibility if we change details like the foreign key name

    Order.new(customer: customer) – better. It created the object through the ActiveRecord relationship, so we can handle the details in that relationship.

    customer.orders.new – best. The order is built directly off the relationship, hiding all the details. We can add things like a validation on customer that they don’t have more than X open orders or whatever else applies to our domain. Note that customer.orders.build is equivalent to calling .new.

# The Many-to-Many Relationship ( Has Many Through )

## Magazine

- title:string 			[present]
- body:text 			[present]
- price:decimal 		[present]

- has_many :subscriptions
- has_many :customers, through: :subscriptions

## Subscription (a join table)

- subscribe:datetime 	[present]
- expire:datetime
- promotion_code:string 

- magazine_id:integer 	[index, present]
- customer_id:integer 	[index, present]

- belongs_to :magazine
- belongs_to :customer

### Data types

- :string - is for small data types such as a title. (Should you choose string or text?)
- :text - is for longer pieces of textual data, such as a paragraph of information
- :binary - is for storing data such as images, audio, or movies.
- :boolean - is for storing true or false values.
- :date - store only the date
- :datetime - store the date and time into a column.
- :time - is for time only

- :timestamp - for storing date and time into a column.(What's the difference between datetime and timestamp?)
### http://stackoverflow.com/questions/409286/should-i-use-field-datetime-or-timestamp

- :decimal - is for decimals (example of how to use decimals).
### http://stackoverflow.com/questions/813287/how-to-store-decimal-values-in-sql-server

- :float - is for decimals. (What's the difference between decimal and float?)
### http://stackoverflow.com/questions/8514167/float-vs-decimal-in-activerecord

- :integer - is for whole numbers.
- :primary_key - unique key that can uniquely identify each row in a table