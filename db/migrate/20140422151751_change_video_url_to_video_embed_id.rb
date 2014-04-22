class ChangeVideoUrlToVideoEmbedId < ActiveRecord::Migration
  def up
    rename_column :videos, :url, :embed_id
  end

  def down
  end
end
