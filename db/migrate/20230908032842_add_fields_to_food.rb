class AddFieldsToFood < ActiveRecord::Migration[7.0]
  def change
    # Add validations columns
    add_column :recipes, :steps, :text
  end
end
