# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_201_029_163_658) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'action_text_rich_texts', force: :cascade do |t|
    t.string 'name', null: false
    t.text 'body'
    t.string 'record_type', null: false
    t.bigint 'record_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index %w[record_type record_id name], name: 'index_action_text_rich_texts_uniqueness', unique: true
  end

  create_table 'active_storage_attachments', force: :cascade do |t|
    t.string 'name', null: false
    t.string 'record_type', null: false
    t.bigint 'record_id', null: false
    t.bigint 'blob_id', null: false
    t.datetime 'created_at', null: false
    t.index ['blob_id'], name: 'index_active_storage_attachments_on_blob_id'
    t.index %w[record_type record_id name blob_id], name: 'index_active_storage_attachments_uniqueness', unique: true
  end

  create_table 'active_storage_blobs', force: :cascade do |t|
    t.string 'key', null: false
    t.string 'filename', null: false
    t.string 'content_type'
    t.text 'metadata'
    t.bigint 'byte_size', null: false
    t.string 'checksum', null: false
    t.datetime 'created_at', null: false
    t.index ['key'], name: 'index_active_storage_blobs_on_key', unique: true
  end

  create_table 'comments', force: :cascade do |t|
    t.string 'title'
    t.text 'body', default: '', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'departments', force: :cascade do |t|
    t.string 'title'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'development_plans', force: :cascade do |t|
    t.string 'title'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.bigint 'department_id'
    t.index ['department_id'], name: 'index_development_plans_on_department_id'
  end

  create_table 'flow_steps', force: :cascade do |t|
    t.string 'title'
    t.bigint 'development_plan_id'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['development_plan_id'], name: 'index_flow_steps_on_development_plan_id'
  end

  create_table 'task_managements', force: :cascade do |t|
    t.integer 'state', default: 0, null: false
    t.bigint 'user_id'
    t.bigint 'task_id'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['task_id'], name: 'index_task_managements_on_task_id'
    t.index ['user_id'], name: 'index_task_managements_on_user_id'
  end

  create_table 'tasks', force: :cascade do |t|
    t.string 'title'
    t.integer 'level'
    t.bigint 'flow_step_id'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['flow_step_id'], name: 'index_tasks_on_flow_step_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'first_name'
    t.string 'last_name'
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.integer 'level', default: 0, null: false
    t.integer 'role', default: 0, null: false
    t.bigint 'department_id'
    t.string 'invitation_token'
    t.datetime 'invitation_created_at'
    t.datetime 'invitation_sent_at'
    t.datetime 'invitation_accepted_at'
    t.integer 'invitation_limit'
    t.string 'invited_by_type'
    t.bigint 'invited_by_id'
    t.integer 'invitations_count', default: 0
    t.index ['department_id'], name: 'index_users_on_department_id'
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['invitation_token'], name: 'index_users_on_invitation_token', unique: true
    t.index ['invitations_count'], name: 'index_users_on_invitations_count'
    t.index ['invited_by_id'], name: 'index_users_on_invited_by_id'
    t.index %w[invited_by_type invited_by_id], name: 'index_users_on_invited_by_type_and_invited_by_id'
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
  end

  add_foreign_key 'active_storage_attachments', 'active_storage_blobs', column: 'blob_id'
  add_foreign_key 'development_plans', 'departments'
  add_foreign_key 'flow_steps', 'development_plans'
  add_foreign_key 'task_managements', 'tasks'
  add_foreign_key 'task_managements', 'users'
  add_foreign_key 'tasks', 'flow_steps'
  add_foreign_key 'users', 'departments'
end
