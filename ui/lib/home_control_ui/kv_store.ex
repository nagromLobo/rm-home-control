defmodule HomeControlUi.KvStore do

  def child_spec(_) do
    %{
      id: __MODULE__,
      start:
        {CubDB, :start_link,
         [
           Application.get_env(:home_control_ui, :kv_store_dir, "/tmp/home_control_kv_store"),
           [auto_file_sync: true, auto_compact: true, name: __MODULE__]
         ]}
    }
  end

end
