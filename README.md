# Base
[![CircleCI](https://circleci.com/gh/castroebarros/base.svg?style=svg)](https://circleci.com/gh/castroebarros/base)

Create simple information systems fastly by using code and feature conventions.

Base is the project that [Castro & Barros](http://castroebarros.net) uses as
base to create information systems for small companies.

## Why

For a long time we have done some Rails projects for a lot of companies and we
have noticed some patterns among these projects, like gems, javascript
libraries, configurations, models, etc.

So we've decided to create a Rails template in order to reduce the time needed
to start new projects. Yes, it worked well some times, but we felt that would
be easier and productive to have a base project that would be cloned, instead
of generate code and copy-and-paste some stuff.

We thought about create some Ruby gems to try make things more reusable, but we
realized that would be still most important to have a good knowledge base.

That way, this project has two goals:
1. serve as a template of project;
2. serve as a place to share and improve conventions.


## Getting started

The Base Project is a template of project that we use to create custom made softwares following some patterns we have adopted during almost 5 years working for small to mid-sized companies.

In general, those projects have 3 main goals:
1. Provide CRM features
2. Provide Process Management features
3. Provide Financial Management features

So, our wish is to take easy the creation of new projects with requirements similar to this, providing templates, libraries and how-tos.

In this document, we are going to create a new project based on our Template project in order you can start to personalize it.

### Cloning the Template project

Let's assume we are creating a new project called "My CRM" in "my_crm" folder:

```bash
git clone https://github.com/castroebarros/base.git my_crm
cd my_crm
git remote rm origin
```

As you can see, the origin branch is not the actual origin of our application, so we ran a git command to delete that remote entry.

### Installing the dependencies

The project is configured with a bunch of gems like pg, will_paginate, simple form, nested form, jquery-rails and more. 

If you it's so much for you feel free to remove some gems from Gemfile.

```bash
bundle install
```

### Database settings
1. Open the config/database.yml file:
2. Fix the username and password of PostgreSQL (if necessary)
3. Rename the database names from "base" to a more suitable name for your project
5. Run rake db:create
6. Run rake db:migrate
7. Run rake db:seed

## Try

Start the server:
```bash
rails s
```

Now we can open the browser: http://localhost:3000

## Application's name and logo

With the `BaseHelper` we can configure the name and the logo of our new application:

```ruby
module BaseHelper
  def app_name
    "My Crm"
  end

  def logo
    'logo.svg'
  end
end
```

The `logo` is used only on login page, and `app_name` is used in both: login page and header of application.

## TODO

- Upgrade bootstrap
- Flash message translations
- Something to take easy association scaffolds (return_to)
- Translation on scaffold (model name)
- Show with long created_at
- Add details link to scaffold index
- Include micro_payments gem
- Include pundit with generators
- Dashboard page
- User registrations (controller, menu)
- Change password
- Recovery password page
- Models and partial for attachment
- Doc to create bucket via aws client


## License

This is a open source under the terms of the MIT License.
