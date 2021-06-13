defmodule HomeControlUi.Devices.LightsTest do
  use HomeControlUi.DataCase

  alias HomeControlUi.LightsTest

  describe "lights crud" do
    alias HomeControlUi.Devices.Lights

    @valid_attrs %{is_on: true, name: "some name"}
    @update_attrs %{is_on: false, name: "some updated name"}
    @invalid_attrs %{is_on: nil, name: nil}

    def light_fixture(attrs \\ %{}) do
      {:ok, light} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Lights.create_light()

      light
    end

    test "list_lights/0 returns all lights" do
      light = light_fixture()
      assert Lights.list_lights() == [light]
    end

    test "get_light!/1 returns the light with given id" do
      light = light_fixture()
      assert Lights.get_light!(light.id) == light
    end

    test "create_light/1 with valid data creates a light" do
      assert {:ok, %Light{} = light} = Lights.create_light(@valid_attrs)
      assert light.is_on == true
      assert light.name == "some name"
    end

    test "create_light/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Lights.create_light(@invalid_attrs)
    end

    test "update_light/2 with valid data updates the light" do
      light = light_fixture()
      assert {:ok, %Light{} = light} = Lights.update_light(light, @update_attrs)
      assert light.is_on == false
      assert light.name == "some updated name"
    end

    test "update_light/2 with invalid data returns error changeset" do
      light = light_fixture()
      assert {:error, %Ecto.Changeset{}} = Lights.update_light(light, @invalid_attrs)
      assert light == Lights.get_light!(light.id)
    end

    test "delete_light/1 deletes the light" do
      light = light_fixture()
      assert {:ok, %Light{}} = Lights.delete_light(light)
      assert_raise Ecto.NoResultsError, fn -> Lights.get_light!(light.id) end
    end

    test "change_light/1 returns a light changeset" do
      light = light_fixture()
      assert %Ecto.Changeset{} = Lights.change_light(light)
    end
  end
end
