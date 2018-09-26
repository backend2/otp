defmodule Exwrap do
  @moduledoc """
  Documentation for Exwrap.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Exwrap.hello()
      :world

  """
  def hello do
    :world
  end

  def elixir_dir_list do
    elixir_home = System.get_env("ELIXIR_HOME")
    [
    "lib/logger/ebin",
    "lib/elixir/ebin",
    "lib/ex_unit/ebin",
    "lib/mix/ebin",
    "lib/eex/ebin",
    "lib/iex/ebin"
     ] |> Enum.map(fn(d) -> Path.join(elixir_home, d) end)
  end

  def beam_dir_list do
    base_dir = System.get_env("ERLANG_HOME") 
      |> Path.join("lib/erlang")
    [
      "lib/kernel-6.0.1/ebin",
      "lib/parsetools-2.1.7/ebin",
      "lib/sasl-3.2/ebin",
      "lib/tools-3.0/ebin",
      "lib/reltool-0.7.6/ebin",
      "lib/erl_interface-3.10.3/ebin",
      "lib/runtime_tools-1.13/ebin",
      "lib/public_key-1.6.1/ebin",
      "lib/erts-10.0.8/ebin",
      "lib/inets-7.0.1/ebin",
      "lib/ssl-9.0.1/ebin",
      "lib/compiler-7.2.4/ebin",
      "lib/stdlib-3.5.1/ebin",
      "lib/syntax_tools-2.1.5/ebin",
      "lib/crypto-4.3.2/ebin",
      "lib/asn1-5.0.6/ebin"
    ] |> Enum.map(fn(d) -> Path.join(base_dir, d) end)
      |> List.flatten(elixir_dir_list)
  end

  def beam_list do
    beam_dir_list
      |> Enum.map(fn(d) -> 
            Enum.map(File.ls!(d), fn(f) -> Path.join(d, f) end)
         end)
      |> List.flatten()
  end

  def upload(db, full_file_name) do
    beam_file = Path.basename(full_file_name)
    beam_data = File.read!(full_file_name)
    insert(db, beam_file, beam_data)
  end

  def upload_all do
    db = open_db()
    create_table(db)
    beam_list
      |> Enum.map(fn(f) ->
           upload(db, f)
         end)
  end

  def beam_file do
    "/Users/petrica/backend2/hello_world/hello.beam"
  end

  def open_db do
    {:ok, db} = :esqlite3.open(':apndvfs:')
    db
  end

  def create_table(db) do
    :esqlite3.exec("""
       CREATE TABLE IF NOT EXISTS BE2_CODE (
          beam_file TEXT NOT NULL PRIMARY KEY, 
          beam_data BLOB NOT NULL
       )
     """, db)
  end

  def test() do
    db = open_db
    create_table(db)
  end

  def insert(db, beam_file, beam_data) do
    :esqlite3.q("INSERT INTO BE2_CODE (beam_file, beam_data) VALUES (?, ?)", [beam_file, beam_data], db)
  end

  def get_beam_data(db, beam_file) do
    [{beam_data}] = :esqlite3.q("SELECT beam_data FROM BE2_CODE WHERE beam_file=?", [beam_file], db)
    beam_data
  end
end
