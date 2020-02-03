# Tori Grasso & Rey Garcia
# This is a very simple implementation of our Database that we did in PyCharm

import sqlite3
from sqlite3 import Error
from graphics import *


def main():
    database = "symposium.db"

    # create a database connection
    conn = create_connection(database)

    c = conn.cursor()

    # create the main window
    main_win = create_main_window()

    while True:
        p = main_win.getMouse()
        x, y = p.getX(), p.getY()

        # if the exit button is clicked
        if 550 <= x <= 570 and 15 <= y <= 30:
            break

        # if submitted research button is clicked
        if 50 <= x <= 250 and 125 <= y <= 275:

            win_work = create_work_window()
            i = 0
            for row in c.execute('SELECT title FROM RESEARCH_WORK'):
                row = row[0]
                if len(row) > 99:
                    row = row[:99] + "..."
                text = Text(Point(300, 140 + i), row)
                text.draw(win_work)
                i = i + 18

            while True:

                p1 = win_work.getMouse()
                x1, y1 = p1.getX(), p1.getY()
                # if the exit button is clicked
                if 550 <= x1 <= 570 and 15 <= y1 <= 30:
                    win_work.close()
                    break

        # if research participants button is clicked
        if 350 <= x <= 550 and 125 <= y <= 275:

            win_part = create_participant_window()
            i, j, count = 0, 0, 0
            for row in c.execute('SELECT sFName, sLName FROM STUDENT ORDER BY sLName'):
                count += 1
                if count > 15:
                    text = Text(Point(200, 160 + i), row)
                    i = i + 25
                else:
                    text = Text(Point(400, 160 + j), row)
                    j = j + 25
                text.draw(win_part)

            while True:
                p2 = win_part.getMouse()
                x2, y2 = p2.getX(), p2.getY()
                # if the exit button is clicked
                if 550 <= x2 <= 570 and 15 <= y2 <= 30:
                    win_part.close()
                    break

        # if winner button is clicked
        if 50 <= x <= 550 and 325 <= y <= 475:

            win_winner = create_winner_window()
            # name of winner
            for row in c.execute('SELECT s.sFName, s.SLName FROM SYMPOSIUM AS sy, STUDENT AS s, WORKS_ON as w WHERE sy.winTitle = w.title AND w.sID = s.sID'):
                name = Text(Point(105, 160), row)
                name.setSize(18)
                name.draw(win_winner)

            # name of winning title
            for row in c.execute('SELECT winTitle FROM SYMPOSIUM'):
                title = Text(Point(255, 185), row[0])
                title.setSize(16)
                title.draw(win_winner)

            # name of supervisor(s) of winning research
            for row in c.execute('SELECT p.pFName, p.pLName FROM PROFESSOR as p, SYMPOSIUM AS sy, SUPERVISED_BY as s WHERE p."fID" = s."fID" AND sy."winTitle" = s.title'):
                sup = Text(Point(175, 210), "Supervised by: " + row[0] + " " + row[1])
                sup.setSize(14)
                sup.draw(win_winner)

            # abstract of winning research
            for row in c.execute('SELECT r.abstract FROM RESEARCH_WORK as r, SYMPOSIUM as sy WHERE sy.winTitle = r.title'):

                s1, s2, s3, s4 = str(row)[2:90], str(row)[90:187], str(row)[187:285], str(row)[285: 372]
                s5, s6, s7, s8 = str(row)[372:464], str(row)[464:558], str(row)[558:650], str(row)[650:745]
                s9, s10, s11, s12 = str(row)[745:846], str(row)[846:947], str(row)[947:1042], str(row)[1042:1132]
                s13, s14 = str(row)[1132:1220], str(row)[1220:len(row)-4]

                a1, a2, a3, a4 = Text(Point(300, 240), s1), Text(Point(300, 255), s2), Text(Point(300, 270), s3), Text(Point(300, 285), s4)
                a5, a6, a7, a8 = Text(Point(300, 300), s5), Text(Point(300, 315), s6), Text(Point(300, 330), s7), Text(Point(300, 345), s8)
                a9, a10, a11, a12 = Text(Point(300, 360), s9), Text(Point(300, 375), s10), Text(Point(300, 390), s11), Text(Point(300, 405), s12)
                a13, a14 = Text(Point(300, 420), s13), Text(Point(300, 435), s14)

                a1.draw(win_winner), a2.draw(win_winner), a3.draw(win_winner), a4.draw(win_winner), a5.draw(win_winner)
                a6.draw(win_winner), a7.draw(win_winner), a8.draw(win_winner), a9.draw(win_winner), a10.draw(win_winner)
                a11.draw(win_winner), a12.draw(win_winner), a13.draw(win_winner), a14.draw(win_winner)

            while True:
                p3 = win_winner.getMouse()
                x3, y3 = p3.getX(), p3.getY()
                # if the exit button is clicked
                if 550 <= x3 <= 570 and 15 <= y3 <= 30:
                    win_winner.close()
                    break

    # close database
    conn.close()


# connect to the sql lite database
def create_connection(db_file):
    conn = None
    try:
        conn = sqlite3.connect(db_file)
    except Error as e:
        print(e)

    return conn


# creating a button with text on it
def button(p1, p2, p3, message, win):
    b = Rectangle(p1, p2)

    text = Text(p3, message)
    text.setSize(10)

    b.draw(win)
    text.draw(win)

    return b, text


# creating the main window
def create_main_window():
    # define colors
    cap_purp = color_rgb(56, 9, 130)
    light_purp = color_rgb(230, 230, 250)

    # create graphics window
    win = GraphWin("Symposium", 600, 600)

    # create text title
    title = Text(Point(300, 60), "Capital University 2020 Symposium")
    title.setSize(24)
    title.setTextColor(cap_purp)
    title.draw(win)

    # create exit button
    button(Point(550, 15), Point(570, 30), Point(560, 23), "X", win)

    # creating the work button
    work, wt = button(Point(50, 125), Point(250, 275), Point(150, 200), "Submitted Research", win)
    work.setFill(light_purp)
    wt.setSize(18)

    # creating the participants button
    part, pt = button(Point(350, 125), Point(550, 275), Point(450, 200), "Research Participants", win)
    part.setFill(light_purp)
    pt.setSize(18)

    # creating the winner button
    winner, wint = button(Point(50, 325), Point(550, 475), Point(300, 400), "2020 Symposium Winner", win)
    winner.setFill(light_purp)
    wint.setSize(18)

    return win


# creating the work window
def create_work_window():
    # define colors
    cap_purp = color_rgb(56, 9, 130)
    light_purp = color_rgb(230, 230, 250)

    # create graphics window
    win = GraphWin("Symposium - Submitted Research", 600, 600)

    # create text title
    title = Text(Point(300, 50), "Capital University 2020 Symposium")
    title.setSize(24)
    title.setTextColor(cap_purp)
    title.draw(win)

    # create exit button
    button(Point(550, 15), Point(570, 30), Point(560, 23), "X", win)

    # create subtitle
    background, sub = button(Point(50, 80), Point(550, 120), Point(300, 100), "Submitted Research", win)
    background.setFill(light_purp)
    sub.setSize(18)

    return win


# creating the participant window
def create_participant_window():
    # define colors
    cap_purp = color_rgb(56, 9, 130)
    light_purp = color_rgb(230, 230, 250)

    # create graphics window
    win = GraphWin("Symposium - Research Participants", 600, 600)

    # create text title
    title = Text(Point(300, 50), "Capital University 2020 Symposium")
    title.setSize(24)
    title.setTextColor(cap_purp)
    title.draw(win)

    # create exit button
    button(Point(550, 15), Point(570, 30), Point(560, 23), "X", win)

    # create subtitle
    background, sub = button(Point(50, 80), Point(550, 120), Point(300, 100), "List of Participants", win)
    background.setFill(light_purp)
    sub.setSize(18)

    return win


# creating the work window
def create_winner_window():
    # define colors
    cap_purp = color_rgb(56, 9, 130)
    light_purp = color_rgb(230, 230, 250)

    # create graphics window
    win = GraphWin("Symposium - 2020 Symposium Winner", 600, 600)

    # create text title
    title = Text(Point(300, 50), "Capital University 2020 Symposium")
    title.setSize(24)
    title.setTextColor(cap_purp)
    title.draw(win)

    # create exit button
    button(Point(550, 15), Point(570, 30), Point(560, 23), "X", win)

    # create subtitle
    background, sub = button(Point(50, 80), Point(550, 120), Point(300, 100), "This Years Winner", win)
    background.setFill(light_purp)
    sub.setSize(18)

    return win


if __name__ == '__main__':
    main()
