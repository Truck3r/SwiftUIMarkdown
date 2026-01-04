//
//  TestData.swift
//  SwiftUIMarkdown
//
//  Created by Sune Riedel on 31/12/2025.
//

// - MARK: Example data
// Copied from here: https://gist.github.com/allysonsilva/85fff14a22bbdf55485be947566cc09e
import SwiftUIMarkdown

// swiftlint:disable file_length trailing_whitespace
public extension MarkdownView {
    static let test =
        """
        # Complete Markdown Syntax & Rendering Test File

        ---

        ## 1. Headings
        # H1
        ## H2
        ### H3
        #### H4
        ##### H5
        ###### H6

        ---

        ## 2. Paragraphs and Line Breaks
        This is a paragraph with  
        a line break (two spaces at end).  

        This is another paragraph.

        ---

        ## 3. Emphasis
        - *Italic*  
        - _Italic_  
        - **Bold**  
        - __Bold__  
        - ***Bold Italic***  
        - ~~Strikethrough~~  

        ---

        ## 4. Lists

        ### Unordered
        - Item 1
        - Item 1.5 with a very long text, that should span multiple lines
        - Item 2
          - Subitem 2a  
            multiple lines
          - Subitem 2b
            - Sub-subitem
              - Sub-sub-subitem
                - Sub-sub-sub-subitem bla-bla-bla-bla
                - Sub-sub-sub-subitem bla-bla-bla-bla

        ---

        - Item 1
        - Item 1.5 with a very long text, that should span multiple lines
        - Item 2
          - Subitem 2a  
            multiple lines
          - Subitem 2b
            - Sub-subitem
              - Sub-sub-subitem
                - Sub-sub-sub-subitem bla-bla-bla-bla

        ### Ordered
        1. First
        2. Second
           1. Sub-second
           2. Sub-second
        3. Third

        ### Mixed
        - Item
          1. Numbered inside bullet
          2. Another

        ---

        ## 5. Links

        - [Inline Link](https://example.com)  
        - [Link with Title](https://example.com "Example Website")  
        - Reference Link: [OpenAI][openai]  

        [openai]: https://openai.com "OpenAI Homepage"

        ---

        ## 6. Images
        - Inline:  
          ![Alt text](https://via.placeholder.com/150)  
        - Reference style:  
          ![Placeholder][image-ref]  

        [image-ref]: https://via.placeholder.com/100 "Small Placeholder"

        ---

        ## 7. Blockquotes
        > This is a blockquote.  
        >  
        > Multiple lines are possible.  
        >
        >> Nested blockquote.

        ---

        ## 8. Code

        ### Inline
        Here’s some `inline code`.

        ### Fenced
        ```python
        def hello_world():
            print("Hello, world!")
        ```

        ### Indented
            This is code using indentation.

        ---

        ## 9. Horizontal Rules
        ---
        ***
        ___

        ---

        ## 10. Tables

        | Syntax | Description | Test Text |
        |--------|-------------|-----------|
        | Header | Title       | Example   |
        | Cell   | Cell        | Cell      |

        ### Alignment
        | Left Aligned | Center Aligned | Right Aligned |
        |:-------------|:--------------:|--------------:|
        | Left         | Center         | Right         |
        | L            | C              | R             |

        ---

        ## 11. Task Lists
        - [x] Completed task  
        - [ ] Incomplete task  
        - [ ] Another task  

        ---

        ## 12. Escaping Characters
        \\*Not italic\\*  
        \\# Not a heading  
        \\`Not code\\`  

        ---

        ## 13. Footnotes
        Here’s a statement with a footnote.[^1]  

        [^1]: This is the footnote text.

        ---

        ## 14. Definition Lists
        Term 1  
        : Definition 1  

        Term 2  
        : Definition 2a  
        : Definition 2b  

        ---

        ## 15. HTML inside Markdown
        <div style="color: red; font-weight: bold;">
        This is raw HTML inside Markdown.
        </div>

        ---

        # Extended Renderer Stress Tests

        ---

        ## 16. Headings Deep Dive
        # Level 1 Heading with **bold**
        ## Level 2 Heading with *italic*
        ### Level 3 Heading with `inline code`
        #### Level 4 Heading with ~~strikethrough~~
        ##### Level 5 Heading with a [link](https://example.com)
        ###### Level 6 Heading with ![icon](https://via.placeholder.com/20)

        ---

        ## 17. Emphasis Variations
        Normal text with **bold _nested italic_ inside**.  
        Mixing ~~strikethrough and *italic*~~.  
        Escaped emphasis: \\*\\*not bold\\*\\*  

        ---

        ## 18. Lists Extended

        ### Unordered with Mixed Content
        - Item with **bold**
        - Item with *italic*
        - Item with `inline code`
        - Item with image ![img](https://via.placeholder.com/30)
        - Item with paragraph

          This is a paragraph inside a list item.

        - Item with blockquote:
          > Nested quote inside list.

        ### Ordered with Long Numbers
        99. Large number  
        100. Large number  
        101. Large number  
        102. Another item  
             1. Subitem  
             1. Subitem  
             1. Subitem  
             1. Subitem  
             1. Subitem  
             1. Subitem  
             1. Subitem  
             1. Subitem  
             1. Subitem  
             1. Subitem  
             1. Subitem with code block:  
                ```js
                console.log("Nested fenced code");
                ```  

        ---

        ## 19. Links Extended
        Autolink: <https://example.org>  
        Email: <test@example.com>  

        ---

        ## 20. Images Extended
        Image with dimensions (via HTML):  
        <img src="https://via.placeholder.com/80x40" alt="html-image" width="80" height="40">  

        Image inside a link:  
        [![Alt text](https://via.placeholder.com/50)](https://example.com)

        ---

        ## 21. Blockquotes Extended
        > Blockquote with multiple elements:
        > - A list item
        > - Another list
        > 
        > ```python
        > print("code inside quote")
        > ```
        >
        > Nested again:
        >> Level 2  
        >>> Level 3

        ---

        ## 22. Code Blocks Extended

        ### Language Specifiers
        ```html
        <div class="test">Hello</div>
        ```

        ```json
        {
          "key": "value",
          "array": [1, 2, 3]
        }
        ```

        ---

        ## 23. Horizontal Rule Stress
        ---
        - Above was HR
        ***
        * * *
        ___

        ---

        ## 24. Tables Extended

        ### Table with Formatting
        | Feature         | Markdown     | Rendered Example  |
        |-----------------|--------------|-------------------|
        | Bold            | `**text**`   | **text**          |
        | Italic          | `*text*`     | *text*            |
        | Inline Code     | `` `code` `` | `code`            |
        | Link            | `[a](b)`     | [a](b)            |

        ---

        ## 25. Task List Variations
        - [x] Checked  
          - [ ] Nested unchecked  
          - [x] Nested checked  
        - [ ] Unchecked with `inline code`  

        ---

        ## 26. Escaping Deep Dive
        Escaped characters:  
        \\* \\_ \\` \\# \\ \\[ \\] \\( \\) \\> \\- \\+ \\= \\! \\| \\{ \\} \\.  

        ---

        ## 27. Footnotes Extended
        This line has a footnote.[^note1] And another.[^note2]

        [^note1]: First footnote content with **bold** text.
        [^note2]: Second footnote with list:  
        - Item A  
        - Item B  

        ---

        ## 28. Definition Lists Extended
        **Markdown**  
        : A lightweight markup language  

        **Renderer**  
        : A program that parses markdown  
        : Outputs HTML or another format  

        ---

        ## 29. Nested Constructs
        - List item with blockquote:  
          > Quote inside  
          > - and a nested list
        - List item with table:  
          | A | B |
          |---|---|
          | 1 | 2 |
          | 3 | 4 |

        ---

        ## 30. Raw HTML Stress
        <table border="1">
          <tr>
            <th>HTML</th>
            <th>Inside</th>
          </tr>
          <tr>
            <td><em>Italic</em></td>
            <td><strong>Bold</strong></td>
          </tr>
        </table>

        ---

        ## 31. Special Cases
        Empty link: []()  
        Empty image: ![]()  
        Long word wrapping:  
        SupercalifragilisticexpialidociousSupercalifragilisticexpialidocious

        ---



        ## 32. Table Alignment via Colons

        Tables demonstrate alignment using colons in the separator row:

        | Feature        | Alignment     | Value   |
        |----------------|:-------------:|--------:|
        | Left Align     | left-aligned  | text    |
        | Center Align   | centered      | centered|
        | Right Align    | right-aligned | 123     |

        Also, classic example:

        | Tables        | Are           | Cool  |
        | ------------- |:-------------:| -----:|
        | col 3 is      | right-aligned | $1600 |
        | col 2 is      | centered      |   $12 |
        | zebra stripes | are neat      |    $1 |

        ✅ **End of Complete Markdown Test Suite**

        """

    static let testDanish =
        """
        # Fuldstændig Markdown-syntaks & Rendering Testfil

        ---

        ## 1. Overskrifter
        # H1
        ## H2
        ### H3
        #### H4
        ##### H5
        ###### H6

        ---

        ## 2. Afsnit og Linjeskift
        Dette er et afsnit med  
        et linjeskift (to mellemrum til sidst).  

        Dette er et andet afsnit.

        ---

        ## 3. Fremhævning
        - *Kursiv*  
        - _Kursiv_  
        - **Fed**  
        - __Fed__  
        - ***Fed Kursiv***  
        - ~~Gennemstreget~~  

        ---

        ## 4. Lister

        ### Uordnet
        - Punkt 1
        - Punkt 1.5 med en meget lang tekst, så den fylder flere linjer
        - Punkt 2
          - Underpunkt 2a  
            flere linjer
          - Underpunkt 2b
            - Under-underpunkt
              - Under-under-underpunkt
                - Under-under-under-underpunkt
                - Under-under-under-underpunkt

        ---

        - Punkt 1
        - Punkt 1.5 med en meget lang tekst, så den fylder flere linjer
        - Punkt 2
          - Underpunkt 2a  
            flere linjer
          - Underpunkt 2b
            - Under-underpunkt
              - Under-under-underpunkt
                - Under-under-under-underpunkt

        ### Ordnet
        1. Første
        2. Anden
           1. Under-anden
           2. Under-anden
        3. Tredje

        ### Blandet
        - Punkt
          1. Nummereret inde i punkt
          2. En til

        ---

        ## 5. Links

        - [Indlejret Link](https://example.com)  
        - [Link med Titel](https://example.com "Eksempelhjemmeside")  
        - Reference Link: [OpenAI][openai]  

        [openai]: https://openai.com "OpenAI Forside"

        ---

        ## 6. Billeder
        - Indlejret:  
          ![Alt tekst](https://via.placeholder.com/150)  
        - Reference-stil:  
          ![Pladsholder][image-ref]  

        [image-ref]: https://via.placeholder.com/100 "Lille Pladsholder"

        ---

        ## 7. Vandrette Linjer
        ---
        ***
        ___

        ---

        ---

        ## 8. Escape af Tegn
        \\*Ikke kursiv\\*  
        \\# Ikke en overskrift  
        \\`Ikke kode\\`  

        ---

        # Udvidede Renderer Stresstests

        ---

        ## 9. Overskrifter Uddybning
        # Niveau 1 Overskrift med **fed**
        ## Niveau 2 Overskrift med *kursiv*
        ### Niveau 3 Overskrift med `indlejret kode`
        #### Niveau 4 Overskrift med ~~gennemstreget~~
        ##### Niveau 5 Overskrift med et [link](https://example.com)
        ###### Niveau 6 Overskrift med ![ikon](https://via.placeholder.com/20)

        ---

        ## 10. Variationer af Fremhævning
        Normal tekst med **fed _indlejret kursiv_ indeni**.  
        Blanding af ~~gennemstreget og *kursiv*~~.  
        Escapet fremhævning: \\*\\*ikke fed\\*\\*  

        ---

        ## 11. Udvidede Lister

        ### Uordnet med Blandet Indhold
        - Punkt med **fed**
        - Punkt med *kursiv*
        - Punkt med `indlejret kode`
        - Punkt med billede ![img](https://via.placeholder.com/30)
        - Punkt med afsnit

          Dette er et afsnit inde i et listepunkt.

        - Punkt med blokcitat:
          > Indlejret citat i liste.

        ### Ordnet med Store Tal
        99. Stort tal  
        100. Stort tal  
        101. Stort tal  
        102. Et andet punkt  
             1. Underpunkt  
             1. Underpunkt  
             1. Underpunkt  
             1. Underpunkt  
             1. Underpunkt  
             1. Underpunkt  
             1. Underpunkt  
             1. Underpunkt  
             1. Underpunkt  
             1. Underpunkt  
             1. Underpunkt med kodeblok:  
                ```js
                console.log("Indlejret afgrænset kode");
                ```  

        ---

        ## 12. Udvidede Links
        Autolink: <https://example.org>  
        Email: <test@example.com>  

        ---

        ## 13. Udvidede Billeder
        Billede med dimensioner (via HTML):  
        <img src="https://via.placeholder.com/80x40" alt="html-billede" width="80" height="40">  

        Billede inde i et link:  
        [![Alt tekst](https://via.placeholder.com/50)](https://example.com)

        ---

        ## 14. Vandret Linje Stress
        ---
        - Ovenfor var HR
        ***
        * * *
        ___

        ---

        ## 15. Escape Uddybning
        Escapede tegn:  
        \\* \\_ \\` \\# \\ \\[ \\] \\( \\) \\> \\- \\+ \\= \\! \\| \\{ \\} \\.  

        ---

        ## 16. Særlige Tilfælde
        Tomt link: []()  
        Tomt billede: ![]()  
        Langt ordbrydning:  
        SupercalifragilisticexpialidociousSupercalifragilisticexpialidocious

        ---

        ✅ **Slut på Fuldstændig Markdown Test Suite**


        """

    static let test2 =
        """
        # Headers

        ```
        # h1 Heading 8-)
        ## h2 Heading
        ### h3 Heading
        #### h4 Heading
        ##### h5 Heading
        ###### h6 Heading

        Alternatively, for H1 and H2, an underline-ish style:

        Alt-H1
        ======

        Alt-H2
        ------
        ```    

        # h1 Heading 8-)
        ## h2 Heading
        ### h3 Heading
        #### h4 Heading
        ##### h5 Heading
        ###### h6 Heading

        Alternatively, for H1 and H2, an underline-ish style:

        Alt-H1
        ======

        Alt-H2
        ------

        ------

        # Emphasis

        ```
        Emphasis, aka italics, with *asterisks* or _underscores_.

        Strong emphasis, aka bold, with **asterisks** or __underscores__.

        Combined emphasis with **asterisks and _underscores_**.

        Strikethrough uses two tildes. ~~Scratch this.~~

        **This is bold text**

        __This is bold text__

        *This is italic text*

        _This is italic text_

        ~~Strikethrough~~
        ```

        Emphasis, aka italics, with *asterisks* or _underscores_.

        Strong emphasis, aka bold, with **asterisks** or __underscores__.

        Combined emphasis with **asterisks and _underscores_**.

        Strikethrough uses two tildes. ~~Scratch this.~~

        **This is bold text**

        __This is bold text__

        *This is italic text*

        _This is italic text_

        ~~Strikethrough~~

        ------

        # Lists

        ```
        1. First ordered list item
        2. Another item
        ⋅⋅* Unordered sub-list.
        1. Actual numbers don't matter, just that it's a number
        ⋅⋅1. Ordered sub-list
        4. And another item.

        ⋅⋅⋅You can have properly indented paragraphs within list items. Notice the blank line above, and the leading spaces (at least one, but we'll use three here to also align the raw Markdown).

        ⋅⋅⋅To have a line break without a paragraph, you will need to use two trailing spaces.⋅⋅
        ⋅⋅⋅Note that this line is separate, but within the same paragraph.⋅⋅
        ⋅⋅⋅(This is contrary to the typical GFM line break behaviour, where trailing spaces are not required.)

        * Unordered list can use asterisks
        - Or minuses
        + Or pluses

        1. Make my changes
            1. Fix bug
            2. Improve formatting
                - Make the headings bigger
        2. Push my commits to GitHub
        3. Open a pull request
            * Describe my changes
            * Mention all the members of my team
                * Ask for feedback

        + Create a list by starting a line with `+`, `-`, or `*`
        + Sub-lists are made by indenting 2 spaces:
          - Marker character change forces new list start:
            * Ac tristique libero volutpat at
            + Facilisis in pretium nisl aliquet
            - Nulla volutpat aliquam velit
        + Very easy!
        ```

        1. First ordered list item
        2. Another item
        ⋅⋅* Unordered sub-list.
        1. Actual numbers don't matter, just that it's a number
        ⋅⋅1. Ordered sub-list
        4. And another item.

        ⋅⋅⋅You can have properly indented paragraphs within list items. Notice the blank line above, and the leading spaces (at least one, but we'll use three here to also align the raw Markdown).

        ⋅⋅⋅To have a line break without a paragraph, you will need to use two trailing spaces.⋅⋅
        ⋅⋅⋅Note that this line is separate, but within the same paragraph.⋅⋅
        ⋅⋅⋅(This is contrary to the typical GFM line break behaviour, where trailing spaces are not required.)

        * Unordered list can use asterisks
        - Or minuses
        + Or pluses

        1. Make my changes
            1. Fix bug
            2. Improve formatting
                - Make the headings bigger
        2. Push my commits to GitHub
        3. Open a pull request
            * Describe my changes
            * Mention all the members of my team
                * Ask for feedback

        + Create a list by starting a line with `+`, `-`, or `*`
        + Sub-lists are made by indenting 2 spaces:
          - Marker character change forces new list start:
            * Ac tristique libero volutpat at
            + Facilisis in pretium nisl aliquet
            - Nulla volutpat aliquam velit
        + Very easy!

        ------

        # Task lists

        ```
        - [x] Finish my changes
        - [ ] Push my commits to GitHub
        - [ ] Open a pull request
        - [x] @mentions, #refs, [links](), **formatting**, and <del>tags</del> supported
        - [x] list syntax required (any unordered or ordered list supported)
        - [x] this is a complete item
        - [ ] this is an incomplete item
        ```

        - [x] Finish my changes
        - [ ] Push my commits to GitHub
        - [ ] Open a pull request
        - [x] @mentions, #refs, [links](), **formatting**, and <del>tags</del> supported
        - [x] list syntax required (any unordered or ordered list supported)
        - [ ] this is a complete item
        - [ ] this is an incomplete item

        ------

        # Ignoring Markdown formatting

        You can tell GitHub to ignore (or escape) Markdown formatting by using \\ before the Markdown character.

        ```
        Let's rename \\*our-new-project\\* to \\*our-old-project\\*.
        ```

        Let's rename \\*our-new-project\\* to \\*our-old-project\\*.

        ------

        # Links

        ```
        [I'm an inline-style link](https://www.google.com)

        [I'm an inline-style link with title](https://www.google.com "Google's Homepage")

        [I'm a reference-style link][Arbitrary case-insensitive reference text]

        [I'm a relative reference to a repository file](../blob/master/LICENSE)

        [You can use numbers for reference-style link definitions][1]

        Or leave it empty and use the [link text itself].

        URLs and URLs in angle brackets will automatically get turned into links.
        http://www.example.com or <http://www.example.com> and sometimes
        example.com (but not on Github, for example).

        Some text to show that the reference links can follow later.

        [arbitrary case-insensitive reference text]: https://www.mozilla.org
        [1]: http://slashdot.org
        [link text itself]: http://www.reddit.com
        ```

        [I'm an inline-style link](https://www.google.com)

        [I'm an inline-style link with title](https://www.google.com "Google's Homepage")

        [I'm a reference-style link][Arbitrary case-insensitive reference text]

        [I'm a relative reference to a repository file](../blob/master/LICENSE)

        [You can use numbers for reference-style link definitions][1]

        Or leave it empty and use the [link text itself].

        URLs and URLs in angle brackets will automatically get turned into links.
        http://www.example.com or <http://www.example.com> and sometimes
        example.com (but not on Github, for example).

        Some text to show that the reference links can follow later.

        [arbitrary case-insensitive reference text]: https://www.mozilla.org
        [1]: http://slashdot.org
        [link text itself]: http://www.reddit.com

        ------

        # Images

        ```
        Here's our logo (hover to see the title text):

        Inline-style:
        ![alt text](https://github.com/adam-p/markdown-here/raw/master/src/common/images/icon48.png "Logo Title Text 1")

        Reference-style:
        ![alt text][logo]

        [logo]: https://github.com/adam-p/markdown-here/raw/master/src/common/images/icon48.png "Logo Title Text 2"

        ![Minion](https://octodex.github.com/images/minion.png)
        ![Stormtroopocat](https://octodex.github.com/images/stormtroopocat.jpg "The Stormtroopocat")

        Like links, Images also have a footnote style syntax

        ![Alt text][id]

        With a reference later in the document defining the URL location:

        [id]: https://octodex.github.com/images/dojocat.jpg  "The Dojocat"
        ```

        Here's our logo (hover to see the title text):

        Inline-style:
        ![alt text](https://github.com/adam-p/markdown-here/raw/master/src/common/images/icon48.png "Logo Title Text 1")

        Reference-style:
        ![alt text][logo]

        [logo]: https://github.com/adam-p/markdown-here/raw/master/src/common/images/icon48.png "Logo Title Text 2"

        ![Minion](https://octodex.github.com/images/minion.png)
        ![Stormtroopocat](https://octodex.github.com/images/stormtroopocat.jpg "The Stormtroopocat")

        Like links, Images also have a footnote style syntax

        ![Alt text][id]

        With a reference later in the document defining the URL location:

        [id]: https://octodex.github.com/images/dojocat.jpg  "The Dojocat"

        ------

        # [Footnotes](https://github.com/markdown-it/markdown-it-footnote)

        ```
        Footnote 1 link[^first].

        Footnote 2 link[^second].

        Inline footnote^[Text of inline footnote] definition.

        Duplicated footnote reference[^second].

        [^first]: Footnote **can have markup**

            and multiple paragraphs.

        [^second]: Footnote text.
        ```

        Footnote 1 link[^first].

        Footnote 2 link[^second].

        Inline footnote^[Text of inline footnote] definition.

        Duplicated footnote reference[^second].

        [^first]: Footnote **can have markup**

            and multiple paragraphs.

        [^second]: Footnote text.

        ------

        # Code and Syntax Highlighting

        ```
        Inline `code` has `back-ticks around` it.
        ```

        Inline `code` has `back-ticks around` it.

        ```c#
        using System.IO.Compression;

        #pragma warning disable 414, 3021

        namespace MyApplication
        {
            [Obsolete("...")]
            class Program : IInterface
            {
                public static List<int> JustDoIt(int count)
                {
                    Console.WriteLine($"Hello {Name}!");
                    return new List<int>(new int[] { 1, 2, 3 })
                }
            }
        }
        ```

        ```css
        @font-face {
          font-family: Chunkfive; src: url('Chunkfive.otf');
        }

        body, .usertext {
          color: #F0F0F0; background: #600;
          font-family: Chunkfive, sans;
        }

        @import url(print.css);
        @media print {
          a[href^=http]::after {
            content: attr(href)
          }
        }
        ```

        ```javascript
        function $initHighlight(block, cls) {
          try {
            if (cls.search(/\\bno\\-highlight\\b/) != -1)
              return process(block, true, 0x0F) +
                     ` class="${cls}"`;
          } catch (e) {
            /* handle exception */
          }
          for (var i = 0 / 2; i < classes.length; i++) {
            if (checkCondition(classes[i]) === undefined)
              console.log('undefined');
          }
        }

        export  $initHighlight;
        ```

        ```php
        require_once 'Zend/Uri/Http.php';

        namespace Location\\Web;

        interface Factory
        {
            static function _factory();
        }

        abstract class URI extends BaseURI implements Factory
        {
            abstract function test();

            public static $st1 = 1;
            const ME = "Yo";
            var $list = NULL;
            private $var;

            /**
             * Returns a URI
             *
             * @return URI
             */
            static public function _factory($stats = array(), $uri = 'http')
            {
                echo __METHOD__;
                $uri = explode(':', $uri, 0b10);
                $schemeSpecific = isset($uri[1]) ? $uri[1] : '';
                $desc = 'Multi
        line description';

                // Security check
                if (!ctype_alnum($scheme)) {
                    throw new Zend_Uri_Exception('Illegal scheme');
                }

                $this->var = 0 - self::$st;
                $this->list = list(Array("1"=> 2, 2=>self::ME, 3 => \\Location\\Web\\URI::class));

                return [
                    'uri'   => $uri,
                    'value' => null,
                ];
            }
        }

        echo URI::ME . URI::$st1;

        __halt_compiler () ; datahere
        datahere
        datahere */
        datahere
        ```

        ------

        # Tables

        ```
        Colons can be used to align columns.

        | Tables        | Are           | Cool  |
        | ------------- |:-------------:| -----:|
        | col 3 is      | right-aligned | $1600 |
        | col 2 is      | centered      |   $12 |
        | zebra stripes | are neat      |    $1 |

        There must be at least 3 dashes separating each header cell.
        The outer pipes (|) are optional, and you don't need to make the
        raw Markdown line up prettily. You can also use inline Markdown.

        Markdown | Less | Pretty
        --- | --- | ---
        *Still* | `renders` | **nicely**
        1 | 2 | 3

        | First Header  | Second Header |
        | ------------- | ------------- |
        | Content Cell  | Content Cell  |
        | Content Cell  | Content Cell  |

        | Command | Description |
        | --- | --- |
        | git status | List all new or modified files |
        | git diff | Show file differences that haven't been staged |

        | Command | Description |
        | --- | --- |
        | `git status` | List all *new or modified* files |
        | `git diff` | Show file differences that **haven't been** staged |

        | Left-aligned | Center-aligned | Right-aligned |
        | :---         |     :---:      |          ---: |
        | git status   | git status     | git status    |
        | git diff     | git diff       | git diff      |

        | Name     | Character |
        | ---      | ---       |
        | Backtick | `         |
        | Pipe     | \\|        |
        ```

        Colons can be used to align columns.

        | Tables        | Are           | Cool  |
        | ------------- |:-------------:| -----:|
        | col 3 is      | right-aligned | $1600 |
        | col 2 is      | centered      |   $12 |
        | zebra stripes | are neat      |    $1 |

        There must be at least 3 dashes separating each header cell.
        The outer pipes (|) are optional, and you don't need to make the
        raw Markdown line up prettily. You can also use inline Markdown.

        Markdown | Less | Pretty
        --- | --- | ---
        *Still* | `renders` | **nicely**
        1 | 2 | 3

        | First Header  | Second Header |
        | ------------- | ------------- |
        | Content Cell  | Content Cell  |
        | Content Cell  | Content Cell  |

        | Command | Description |
        | --- | --- |
        | git status | List all new or modified files |
        | git diff | Show file differences that haven't been staged |

        | Command | Description |
        | --- | --- |
        | `git status` | List all *new or modified* files |
        | `git diff` | Show file differences that **haven't been** staged |

        | Left-aligned | Center-aligned | Right-aligned |
        | :---         |     :---:      |          ---: |
        | git status   | git status     | git status    |
        | git diff     | git diff       | git diff      |

        | Name     | Character |
        | ---      | ---       |
        | Backtick | `         |
        | Pipe     | \\|        |

        ------

        # Blockquotes

        ```
        > Blockquotes are very handy in email to emulate reply text.
        > This line is part of the same quote.

        Quote break.

        > This is a very long line that will still be quoted properly when it wraps. Oh boy let's keep writing to make sure this is long enough to actually wrap for everyone. Oh, you can *put* **Markdown** into a blockquote.

        > Blockquotes can also be nested...
        >> ...by using additional greater-than signs right next to each other...
        > > > ...or with spaces between arrows.
        ```

        > Blockquotes are very handy in email to emulate reply text.
        > This line is part of the same quote.

        Quote break.

        > This is a very long line that will still be quoted properly when it wraps. Oh boy let's keep writing to make sure this is long enough to actually wrap for everyone. Oh, you can *put* **Markdown** into a blockquote.

        > Blockquotes can also be nested...
        >> ...by using additional greater-than signs right next to each other...
        > > > ...or with spaces between arrows.

        ------

        # Inline HTML

        ```
        <dl>
          <dt>Definition list</dt>
          <dd>Is something people use sometimes.</dd>

          <dt>Markdown in HTML</dt>
          <dd>Does *not* work **very** well. Use HTML <em>tags</em>.</dd>
        </dl>
        ```

        <dl>
          <dt>Definition list</dt>
          <dd>Is something people use sometimes.</dd>

          <dt>Markdown in HTML</dt>
          <dd>Does *not* work **very** well. Use HTML <em>tags</em>.</dd>
        </dl>

        ------

        # Horizontal Rules

        ```
        Three or more...

        ---

        Hyphens

        ***

        Asterisks

        ___

        Underscores
        ```

        Three or more...

        ---

        Hyphens

        ***

        Asterisks

        ___

        Underscores

        ------

        # YouTube Videos

        ```
        <a href="http://www.youtube.com/watch?feature=player_embedded&v=YOUTUBE_VIDEO_ID_HERE" target="_blank">
        <img src="http://img.youtube.com/vi/YOUTUBE_VIDEO_ID_HERE/0.jpg" alt="IMAGE ALT TEXT HERE" width="240" height="180" border="10">
        </a>
        ```

        <a href="http://www.youtube.com/watch?feature=player_embedded&v=YOUTUBE_VIDEO_ID_HERE" target="_blank">
        <img src="http://img.youtube.com/vi/YOUTUBE_VIDEO_ID_HERE/0.jpg" alt="IMAGE ALT TEXT HERE" width="240" height="180" border="10">
        </a>

        ```
        [![IMAGE ALT TEXT HERE](http://img.youtube.com/vi/YOUTUBE_VIDEO_ID_HERE/0.jpg)](http://www.youtube.com/watch?v=YOUTUBE_VIDEO_ID_HERE)
        ```

        [![IMAGE ALT TEXT HERE](https://upload.wikimedia.org/wikipedia/commons/thumb/e/ef/YouTube_logo_2015.svg/1200px-YouTube_logo_2015.svg.png)](https://www.youtube.com/watch?v=ciawICBvQoE)
        """
}

// swiftlint:disable file_length trailing_whitespace
