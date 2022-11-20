defmodule BackRfWeb.SentenceControllerTest do
  use BackRfWeb.ConnCase

  import BackRf.RandomFixtures

  alias BackRf.Random.Sentence

  @create_attrs %{
    author: "some author",
    sentence: "some sentence"
  }
  @update_attrs %{
    author: "some updated author",
    sentence: "some updated sentence"
  }
  @invalid_attrs %{author: nil, sentence: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all sentences", %{conn: conn} do
      conn = get(conn, Routes.sentence_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create sentence" do
    test "renders sentence when data is valid", %{conn: conn} do
      conn = post(conn, Routes.sentence_path(conn, :create), sentence: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.sentence_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "author" => "some author",
               "sentence" => "some sentence"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.sentence_path(conn, :create), sentence: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update sentence" do
    setup [:create_sentence]

    test "renders sentence when data is valid", %{conn: conn, sentence: %Sentence{id: id} = sentence} do
      conn = put(conn, Routes.sentence_path(conn, :update, sentence), sentence: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.sentence_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "author" => "some updated author",
               "sentence" => "some updated sentence"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, sentence: sentence} do
      conn = put(conn, Routes.sentence_path(conn, :update, sentence), sentence: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete sentence" do
    setup [:create_sentence]

    test "deletes chosen sentence", %{conn: conn, sentence: sentence} do
      conn = delete(conn, Routes.sentence_path(conn, :delete, sentence))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.sentence_path(conn, :show, sentence))
      end
    end
  end

  defp create_sentence(_) do
    sentence = sentence_fixture()
    %{sentence: sentence}
  end
end
