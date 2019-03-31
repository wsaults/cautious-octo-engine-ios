# cautious-octo-engine-ios

## Problem statment

As a user I would like to take a skills based test in order to better represent myself as a professional in my field.

### Stories

### ✅ Story - I see a list of skill categories

`GIVEN:` I have opened the app.
`THEN:` I see a list of skill categories.

`Ex: Sports & Games, Technology, Trades`

### ✅ Story - I see a list of skill sub categories

`GIVEN:` I can see a list of skill categories.
`WHEN:` I tap on a category.
`THEN:` I see a list of skill sub categories.

`Ex: Technology > Gaming, Hardware, IT, Programming, Software, Tech Repairs`

### ✅ Story - I see a list of skills

`GIVEN:` I can see a list of skill sub categories.
`WHEN:` I tap on a sub category.
`THEN:` I see a list of skills.

`Ex: Swift, TypeScript, JavaScript, Java`

### ✅ Story - I see a Multiple choice question

`GIVEN:` I can see a list of skills.
`WHEN:` I tap on a skill.
`THEN:` I see a multiple choice question with 4 answers.

### ✅ Story - I see '1 of 10 Questions'

`GIVEN:` I can see a multiple choice question.
`THEN:` I see '1 of 10 Questions'.

### ✅ Story - I see the 'Next Question' button

`GIVEN:` I see a Multiple choice question.
`WHEN:` I tap on an answer.
`THEN:` I see the 'Next Question' button.

### 👨🏼‍💻 Story - The answer turns red

`GIVEN:` I tap on an answer.
`WHEN:` When the answer is wrong.
`THEN:` The answer turns red.

### Story - I Cannot tap another answer

`GIVEN:` I tap on an answer.
`THEN:` The answer turns red.
`AND:` I cannot tap another answer

### Story - The answer turns green

`GIVEN:` I tap on an answer.
`WHEN:` When the answer is correct.
`THEN:` The answer turns green.

### Story - I see '2 of 10 questions'

`GIVEN:` I answer a question.
`WHEN:` I tap on the 'Next Question' button.
`THEN:` I see the next question.
`AND:` I see '2 of 10 questions'.

### Story - I see a summary of my results

`GIVEN:` I answer all questoins.
`WHEN:` I tap on the 'Next Question' button.
`THEN:` I see a summary of my results.

### Story - I see a count down timer

`GIVEN:` I see a Multiple choice question.
`THEN:` I see a timer containing the remaining seconds to answer the question.
`AND:` The timer is approaching zero seconds.

### Story - I see the question answer wrong when the time runs out

`GIVEN:` I see timer counting down.
`WHEN:` The timer reacher zero.
`THEN:` I get the question wrong.
`AND:` I see the next question.

### Backlog

<!-- ### Story 2

`GIVEN:` I can see a list of skill categories.
`THEN:` I can see a search bar at the top of the view.
`WHEN:` When I type in the search bar.
`THEN:` I see a filtered list of results -->