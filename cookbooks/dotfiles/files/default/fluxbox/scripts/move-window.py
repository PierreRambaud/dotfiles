#!/usr/bin/env python

import re
import sys
from subprocess import Popen, PIPE, check_output, call

class Screens:
    def __init__(self, direction):
        self.check_direction(direction)
        self.max_width = 0
        p1 = Popen(["xrandr"], stdout=PIPE)
        p2 = Popen(["grep", " connected"], stdin=p1.stdout, stdout=PIPE)
        p1.stdout.close()
        screens = re.findall('([0-9]{3,4})x([0-9]{3,4})(?:\+(\d+))?', str(p2.communicate()[0]))

        self.screens = []
        for screen in screens:
            self.max_width += int(screen[0])
            self.screens.append(Screen(int(screen[0]), int(screen[1]), int(screen[2])))

        self.current_window()
        self.move(direction)

    def check_direction(self, direction):
        if direction not in ['left', 'right']:
            raise ValueError('Direction %s is not valid' % direction)

    def current_window(self):
        output = str(check_output('xwininfo -id $(xdotool getactivewindow) -all', shell=True))
        x = re.findall('Absolute upper-left X:\s+(\d+)', output)
        width = re.findall('Width:\s+(\d+)', output)
        is_maximize = re.findall('Window state:', output)
        self.window = Window(int(x[0]), int(width[0]), is_maximize != [])

    def move(self, direction):
        value = None
        for screen in self.screens:
            if direction == 'left':
                if self.window.x > (screen.width + screen.position):
                    value = self.window.x - screen.width
                elif value:
                    value -= screen.position

            if direction == 'right' and self.window.x < (screen.position):
                value = self.window.x + screen.position
                break

        if value and value >= (self.max_width - self.window.width):
            value = self.max_width - self.window.width

        if value:
            self.fluxbox_move(value)
            self.fluxbox_maximize()


    def fluxbox_move(self, value):
        call(['fluxbox-remote', ('MoveTo %s * Left' % value)])

    def fluxbox_maximize(self):
        if self.window.is_maximize:
            call(['fluxbox-remote', 'Maximize'])

class Screen:
    def __init__(self, width, height, position):
        self.width = width
        self.height = height
        self.position = position

class Window:
    def __init__(self, x, width, is_maximize):
        self.x = x
        self.width = width
        self.is_maximize = is_maximize


if len(sys.argv) == 2:
    s = Screens(sys.argv[1])
