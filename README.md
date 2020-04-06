# README


* Ruby version --> ruby 2.6.1p33

* Rails version --> Rails 5.2.4.2

--------------------------------------------------------------------------------------------------------------------------------------------
* INSTALLATION
	These steps are for Linux Operating System(Preferably Ubuntu).

	#Install MySQL and setup using these commands, make sure the password you select is easy to remember
		sudo apt install mysql-server
		sudo mysql_secure_installation
	#Note: After this setup you should be able to run  MySQL using this command, if not then try some of these issue links 
		mysql -u root -p
	(In case you get wrong password, do `sudo su`, then `mysql` create new user with password and use that)

	#Installing RubyOnRails using rvm (ruby version manager)
	
	#First, install curl and gnupg
		sudo apt install curl
		sudo apt install gnupg2

	#Now, run these commands to install rvm
		curl -sSL https://rvm.io/mpapis.asc | gpg2 --import -  
		curl -sSL https://get.rvm.io | bash -s stable

	Important : For RVM to work properly, you have to check the 'Run command as login shell' checkbox on the Title and Command tab of the 			   terminal's Edit 
		     ▸ Profile Preferences menu dialog, in case the menu is missing right-click the terminal app and navigate 			   Profiles 
		     ▸ Profile Preferences.

	#Now run these to install rails 5.2.2 with ruby 2.6.1
		rvm install 2.6.1
		rvm use 2.6.1 --default
		gem install bundler
		gem install rails -v 5.2.2
	#Install mysql gem and the libmysql-dev library
		sudo apt install libmysqld-dev
		gem install mysql2
	Note: For some of the js gems
		sudo apt install nodejs

--------------------------------------------------------------------------------------------------------------------------------------------
* Deployment instructions :
	* Clone the project from GIT .Complete steps to run your project,
	* Change into the directory of the project.
	* Now navigate to /demo/config/database.yml and edit the MySQL username and password.
	* Then run 
		bundle install
	* Then create and initialize DB
		rake db:create
		rake db:migrate
	* Then to run the server on localhost
		rails s
	* Now open a browser and goto 
		http://localhost:3000/
--------------------------------------------------------------------------------------------------------------------------------------------
* Implemented Features:
	* All the features mentioned in :
		https://docs.google.com/document/d/1ZeF3OgB_SSQrFhCwBgDLO6c3-DJqsVADbQ3BXtUs79Y/edit
	 have been implemented
	* Receipt of the sold product can also be downloaded in pdf format.
	* If a product is unsold,the seller still has got the option to either take it down or improve 
	  and extend it's deadline so that it get's automatically re-posted into the Auction market.
	  
* Disadvantages/Bugs:
	* Deadline has to be entered in UTC(+0:00).
	* Once the deadline of a product is up, the owner can't see his product until the guy who bought it claims it.
--------------------------------------------------------------------------------------------------------------------------------------------
* Resources:
	* Stackoverflow
	* https://guides.rubyonrails.org
	* https://apidock.com/rails
	* https://github.com/carrierwaveuploader/carrierwave
	* https://github.com/twbs/bootstrap-rubygem
	  and more
--------------------------------------------------------------------------------------------------------------------------------------------
* Mentors:

	* Manas Gupta
	* Vithik Shah
	* Bharath Adikar

