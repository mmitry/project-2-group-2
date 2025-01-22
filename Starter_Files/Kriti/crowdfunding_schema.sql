CREATE TABLE "category" (
    "category_id" varchar(50)   NOT NULL,
    "category" varchar(50)   NOT NULL,
    "last_updated" timestamp   default localtimestamp,
    CONSTRAINT "pk_category" PRIMARY KEY (
        "category_id"
     )
);

CREATE TABLE "subcategory" (
    "subcategory_id" varchar(50)   NOT NULL,
    "subcategory" varchar(50)   NOT NULL,
    "last_updated" timestamp    default localtimestamp,
    CONSTRAINT "pk_subcategory" PRIMARY KEY (
        "subcategory_id"
     )
);

CREATE TABLE "campaign" (
    "cf_id" int   NOT NULL,
    "contact_id" int   NOT NULL,
    "company_name" varchar(50)   NOT NULL,
    "description" text   NOT NULL,
    "goal" int   NOT NULL,
    "pledged" int   NOT NULL,
    "outcome" varchar(15)   NOT NULL,
    "backers_count" int   NOT NULL,
    "country" varchar(50)   NOT NULL,
    "currency" varchar(50)   NOT NULL,
    "launch_date" date   NOT NULL,
    "category" varchar(100)   NOT NULL,
    "subcategory" varchar(100)   NOT NULL,
    "end_date" date   NOT NULL,
    "category_id" varchar(50)   NOT NULL,
    "subcategory_id" varchar(50)   NOT NULL,
    "last_updated" timestamp    default localtimestamp,
    CONSTRAINT "pk_campaign" PRIMARY KEY (
        "cf_id"
     )
);

CREATE TABLE "contacts" (
    "contact_id" int   NOT NULL,
    "first_name" varchar(50)   NOT NULL,
    "last_name" varchar(50)   NOT NULL,
    "email" varchar(50)   NOT NULL,
    "last_updated" timestamp    default localtimestamp,
    CONSTRAINT "pk_contacts" PRIMARY KEY (
        "contact_id"
     )
);

ALTER TABLE "campaign" ADD CONSTRAINT "fk_campaign_contact_id" FOREIGN KEY("contact_id")
REFERENCES "contacts" ("contact_id");

ALTER TABLE "campaign" ADD CONSTRAINT "fk_campaign_category_id" FOREIGN KEY("category_id")
REFERENCES "category" ("category_id");

ALTER TABLE "campaign" ADD CONSTRAINT "fk_campaign_subcategory_id" FOREIGN KEY("subcategory_id")
REFERENCES "subcategory" ("subcategory_id");

