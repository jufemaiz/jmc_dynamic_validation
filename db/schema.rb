# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110516233332) do

  create_table "divisions", :force => true do |t|
    t.date     "age_as_of"
    t.integer  "age_max"
    t.integer  "age_min"
    t.boolean  "age_restriction"
    t.date     "dob_max"
    t.date     "dob_min"
    t.decimal  "fee",                :precision => 10, :scale => 0
    t.string   "gender"
    t.integer  "grade_max"
    t.integer  "grade_min"
    t.boolean  "grade_restriction"
    t.integer  "height_max"
    t.integer  "height_min"
    t.boolean  "height_restriction"
    t.string   "name"
    t.string   "state"
    t.integer  "weight_max"
    t.integer  "weight_min"
    t.boolean  "weight_restriction"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "questions", :force => true do |t|
    t.string   "question_type"
    t.string   "question_text"
    t.text     "question_choices"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "division_id",      :null => false
  end

  create_table "registrations", :force => true do |t|
    t.string   "state"
    t.integer  "registerable_id"
    t.string   "registerable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "responses", :force => true do |t|
    t.text     "text",            :null => false
    t.integer  "question_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "registration_id", :null => false
  end

end
