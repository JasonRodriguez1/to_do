ActiveRecord::Schema.define(version: 20130923212757) do

  enable_extension "plpgsql"

  create_table "lists", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tasks", force: true do |t|
    t.string   "description"
    t.boolean  "completed"
    t.date     "duedate"
    t.integer  "list_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
