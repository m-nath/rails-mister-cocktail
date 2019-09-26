class AddBannerAndDescriptionToCocktails < ActiveRecord::Migration[5.2]
  def change
    add_column :cocktails, :banner, :string
    add_column :cocktails, :description, :text
  end
end
