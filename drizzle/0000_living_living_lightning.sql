DO $$ BEGIN
 CREATE TYPE "public"."category_type" AS ENUM('Restaurant', 'Grocery', 'Other');
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 CREATE TYPE "public"."cuisine_name" AS ENUM('American', 'Brazilian', 'Cajun & Creole', 'Chinese', 'Colombian', 'Comfort', 'Cuban', 'Diner', 'Ethiopian', 'Filipino', 'French', 'Fusion', 'Gluten-free', 'Greek', 'Hawaiian', 'Healthy', 'Indian', 'Italian', 'Japanese', 'Korean', 'Kosher', 'Latin American', 'Mediterranean', 'Mexican', 'Middle Eastern', 'Moroccan', 'Nepalese', 'Paleo', 'Peruvian', 'Raw', 'Soul', 'Southern', 'Street', 'Tex-Mex', 'Thai', 'Vietnamese');
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 CREATE TYPE "public"."plant_based_level" AS ENUM('full', 'partial');
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 CREATE TYPE "public"."tag_name" AS ENUM('Bakery', 'Breakfast', 'Lunch', 'Dinner', 'Confectionery', 'Desserts', 'Fast', 'Fast Casual', 'Grocery', 'Raw', 'Restaurant', 'Tapas');
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "category" (
	"id" serial PRIMARY KEY NOT NULL,
	"category_type" "category_type"
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "cuisine" (
	"id" serial PRIMARY KEY NOT NULL,
	"cuisine_name" "cuisine_name"
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "location" (
	"id" serial PRIMARY KEY NOT NULL,
	"name" text,
	"lat" numeric,
	"long" numeric,
	"date_updated" timestamp,
	"menu" json,
	"plant_based_level" "plant_based_level",
	"address" text,
	"editor_rating" numeric,
	"user_rating" numeric
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "location_category" (
	"id" serial PRIMARY KEY NOT NULL,
	"location_id" integer NOT NULL,
	"category_id" integer NOT NULL
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "location_cuisine" (
	"id" serial PRIMARY KEY NOT NULL,
	"location_id" integer NOT NULL,
	"cuisine_id" integer NOT NULL
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "location_tag" (
	"id" serial PRIMARY KEY NOT NULL,
	"location_id" integer NOT NULL,
	"tag_id" integer NOT NULL
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "tag" (
	"id" serial PRIMARY KEY NOT NULL,
	"tag_name" "tag_name"
);
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "location_category" ADD CONSTRAINT "location_category_location_id_location_id_fk" FOREIGN KEY ("location_id") REFERENCES "public"."location"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "location_category" ADD CONSTRAINT "location_category_category_id_category_id_fk" FOREIGN KEY ("category_id") REFERENCES "public"."category"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "location_cuisine" ADD CONSTRAINT "location_cuisine_location_id_location_id_fk" FOREIGN KEY ("location_id") REFERENCES "public"."location"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "location_cuisine" ADD CONSTRAINT "location_cuisine_cuisine_id_cuisine_id_fk" FOREIGN KEY ("cuisine_id") REFERENCES "public"."cuisine"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "location_tag" ADD CONSTRAINT "location_tag_location_id_location_id_fk" FOREIGN KEY ("location_id") REFERENCES "public"."location"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "location_tag" ADD CONSTRAINT "location_tag_tag_id_tag_id_fk" FOREIGN KEY ("tag_id") REFERENCES "public"."tag"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
