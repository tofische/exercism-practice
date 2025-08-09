use std::fmt;
#[derive(Debug)]

pub struct Clock {
    h: i32,
    m: i32
}

impl Clock {

    pub fn new(hours: i32, minutes: i32) -> Self {
        Clock {
            h: (hours + minutes.div_euclid(60)).rem_euclid(24),
            m: minutes.rem_euclid(60),
        }
    }

    pub fn add_minutes(&self, minutes: i32) -> Self {
        Clock::new(self.h, self.m + minutes)
    }
}

impl fmt::Display for Clock {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        write!(f, "{:02}:{:02}", self.h, self.m)
    }
}

impl PartialEq for Clock {
    fn eq(&self, other: &Clock) -> bool {
        self.h == other.h && self.m == other.m
    }
}