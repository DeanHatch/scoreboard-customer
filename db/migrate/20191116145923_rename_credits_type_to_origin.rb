class RenameCreditsTypeToOrigin < ActiveRecord::Migration[5.1]
  def change
    rename_column :credits, :type, :origin
  end
end
