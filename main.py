# This is a sample Python script.
import pandas as pd
import numpy as np
import pyodbc


if __name__ == '__main__':

    # establishing connection
    cnxn = pyodbc.connect(
        'DRIVER={CData ODBC Driver for Cassandra};Database = musicsdb;Port = 9042;Server = localhost;')

    # instantiate a Cursor and use the execute method of the Cursor class to execute any SQL statement
    query = cnxn.cursor()
    query2 = cnxn.cursor()

    query.execute("SELECT * FROM musicsdb.musics	")
    query2.execute("SELECT * FROM musicsdb.musics_by_artist WHERE artist = 'Kendrick Lamar'")

    rows = query.fetchall()
    rows2 = query2.fetchall()

    # transforming into a list
    rows_list = np.array(rows).tolist()
    rows2_list = np.array(rows2).tolist()

    # create the dataframes
    df = pd.DataFrame(rows_list, columns=['id', 'Album', 'Artist', 'bad', 'good', 'name', 'ok', 'view'])
    df_kendrick = pd.DataFrame(rows2_list, columns=['Artist', 'id', 'Album', 'bad', 'good', 'name', 'ok', 'view'])

    # to visualize the dataframes
    # print(df.head())
    # print(df_kendrick)

    # a simple transformation creating a new column
    df['Score'] = (df.bad.astype(int) + df.ok.astype(int) + df.good.astype(int))/3

    # save the dataframes in csv
    df.to_csv('data_cassandra.csv')
    df_kendrick.to_csv('kendrick_view.csv')
