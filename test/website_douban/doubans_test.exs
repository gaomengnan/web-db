defmodule WebsiteDouban.DoubansTest do
  use WebsiteDouban.DataCase

  alias WebsiteDouban.Doubans

  describe "douban" do
    alias WebsiteDouban.Doubans.Douban

    import WebsiteDouban.DoubansFixtures

    @invalid_attrs %{}

    test "list_douban/0 returns all douban" do
      douban = douban_fixture()
      assert Doubans.list_douban() == [douban]
    end

    test "get_douban!/1 returns the douban with given id" do
      douban = douban_fixture()
      assert Doubans.get_douban!(douban.id) == douban
    end

    test "create_douban/1 with valid data creates a douban" do
      valid_attrs = %{}

      assert {:ok, %Douban{} = douban} = Doubans.create_douban(valid_attrs)
    end

    test "create_douban/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Doubans.create_douban(@invalid_attrs)
    end

    test "update_douban/2 with valid data updates the douban" do
      douban = douban_fixture()
      update_attrs = %{}

      assert {:ok, %Douban{} = douban} = Doubans.update_douban(douban, update_attrs)
    end

    test "update_douban/2 with invalid data returns error changeset" do
      douban = douban_fixture()
      assert {:error, %Ecto.Changeset{}} = Doubans.update_douban(douban, @invalid_attrs)
      assert douban == Doubans.get_douban!(douban.id)
    end

    test "delete_douban/1 deletes the douban" do
      douban = douban_fixture()
      assert {:ok, %Douban{}} = Doubans.delete_douban(douban)
      assert_raise Ecto.NoResultsError, fn -> Doubans.get_douban!(douban.id) end
    end

    test "change_douban/1 returns a douban changeset" do
      douban = douban_fixture()
      assert %Ecto.Changeset{} = Doubans.change_douban(douban)
    end
  end
end
