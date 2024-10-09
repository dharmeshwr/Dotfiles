return {
	"nvimdev/dashboard-nvim",
	lazy = false,
	opts = function()
		local date_str = os.date("%A, %B %d, %Y")

		local handle = io.popen('figlet -f standard "' .. date_str .. '"')
		local logo = handle:read("*a")
		handle:close()

		logo = string.rep("\n", 2) .. logo .. "\n"

		local quotes = {
			{ text = "Talk is cheap. Show me the code.", author = "Linus Torvalds" },
			{ text = "The best way to predict the future is to invent it.", author = "Alan Kay" },
			{ text = "Software is a great combination between artistry and engineering.", author = "Bill Gates" },
			{ text = "First, solve the problem. Then, write the code.", author = "John Johnson" },
			{
				text = "Any fool can write code that a computer can understand. Good programmers write code that humans can understand.",
				author = "Martin Fowler",
			},
			{ text = "In order to be irreplaceable, one must always be different.", author = "Coco Chanel" },
			{ text = "Good code is its own best documentation.", author = "Steve McConnell" },
			{ text = "It's not a bug, it's an undocumented feature.", author = "Anonymous" },
			{ text = "The most effective debugging tool is still careful thought.", author = "Brian Kernighan" },
			{
				text = "Programming is like sex. One mistake and you have to support it for the rest of your life.",
				author = "Michael Sinz",
			},
			{ text = "The only way to go fast is to go well.", author = "Robert C. Martin" },
			{ text = "Simplicity is the soul of efficiency.", author = "Austin Freeman" },
			{
				text = "The trouble with the world is that the stupid are cocksure and the intelligent are full of doubt.",
				author = "Bertrand Russell",
			},
			{ text = "Code is like humor. When you have to explain it, it’s bad.", author = "Cory House" },
			{ text = "Simplicity is the ultimate sophistication.", author = "Leonardo da Vinci" },
			{ text = "The best error message is the one that never shows up.", author = "Thomas Fuchs" },
			{ text = "If you think good architecture is expensive, try bad architecture.", author = "Brian Foote" },
			{
				text = "There are only two kinds of programming languages: those people always bicker about and those that nobody uses.",
				author = "Bjarne Stroustrup",
			},
			{ text = "The real problem is not whether machines think but whether men do.", author = "B. F. Skinner" },
			{
				text = "The function of good software is to make the complex appear to be simple.",
				author = "Grady Booch",
			},
			{
				text = "Debugging is like being the detective in a crime movie where you are also the murderer.",
				author = "Filipe Fortes",
			},
			{
				text = "The only thing worse than a poorly designed system is a poorly designed system that is well implemented.",
				author = "John F. van Doren",
			},
			{
				text = "Programs must be written for people to read, and only incidentally for machines to execute.",
				author = "Harold Abelson",
			},
			{
				text = "There are only two hard things in computer science: cache invalidation and naming things.",
				author = "Phil Karlton",
			},
			{
				text = "If you can’t explain it simply, you don’t understand it well enough.",
				author = "Albert Einstein",
			},
			{
				text = "A good programmer is someone who always looks both ways before crossing a one-way street.",
				author = "Doug Linder",
			},
			{
				text = "You can’t have great software without a great team, and most software teams behave like dysfunctional families.",
				author = "Jim McCarthy",
			},
			{ text = "To iterate is human, to recurse divine.", author = "L. Peter Deutsch" },
			{
				text = "Measuring programming progress by lines of code is like measuring aircraft building progress by weight.",
				author = "Bill Gates",
			},
			{ text = "One of my most productive days was throwing away 1,000 lines of code.", author = "Ken Thompson" },
			{
				text = "The best way to get a project back on track is to throw it away and start over.",
				author = "Anonymous",
			},
			{ text = "You can't just throw code at a problem and expect it to go away.", author = "Anonymous" },
			{
				text = "The greatest enemy of knowledge is not ignorance, it is the illusion of knowledge.",
				author = "Stephen Hawking",
			},
			{
				text = "People who are really serious about software should make their own hardware.",
				author = "Alan Kay",
			},
			{
				text = "Good programmers know what to write. Great programmers know what to rewrite.",
				author = "Anonymous",
			},
			{
				text = "The most important thing about software is that it is not the code, but what it does for the user.",
				author = "Steve Jobs",
			},
			{
				text = "Software is like entropy: It increases, it is not decreased.",
				author = "Norman Ralph Augustine",
			},
			{
				text = "If you don’t like the way the world is, you change it. You change it by taking action.",
				author = "Tom Peters",
			},
			{ text = "Innovation distinguishes between a leader and a follower.", author = "Steve Jobs" },
			{
				text = "What we want is a machine that can take our creativity and make it better.",
				author = "Jaron Lanier",
			},
			{ text = "You can't build a reputation on what you are going to do.", author = "Henry Ford" },
			{ text = "When all you have is a hammer, everything looks like a nail.", author = "Abraham Maslow" },
			{ text = "A computer is like a bicycle for our minds.", author = "Steve Jobs" },
			{ text = "The art of programming is the art of organizing complexity.", author = "David Gelernter" },
			{
				text = "In software, we rarely have the luxury of getting things right the first time.",
				author = "Michael Lopp",
			},
			{
				text = "You don't have to be a genius to be a good programmer. You just have to be good at learning.",
				author = "Anonymous",
			},
			{
				text = "Never underestimate the power of a small group of committed people to change the world.",
				author = "Margaret Mead",
			},
			{ text = "Good design adds value faster than it adds costs.", author = "Thomas C. Gale" },
			{
				text = "If you can't explain it to a six-year-old, you don't understand it yourself.",
				author = "Albert Einstein",
			},
			{ text = "Sometimes the questions are complicated and the answers are simple.", author = "Dr. Seuss" },
		}

		local selected_quote = quotes[math.random(#quotes)]

		local opts = {
			theme = "doom",
			hide = {
				statusline = false,
			},
			config = {
				header = vim.split(logo, "\n"),
				center = {
					{
						action = "lua LazyVim.pick()()",
						desc = " Find File",
						icon = " ",
						key = "f",
					},
					{
						action = "ene | startinsert",
						desc = " New File",
						icon = " ",
						key = "n",
					},
					{
						action = 'lua LazyVim.pick("oldfiles")()',
						desc = " Recent Files",
						icon = " ",
						key = "r",
					},
					{
						action = 'lua LazyVim.pick("live_grep")()',
						desc = " Find Text",
						icon = " ",
						key = "g",
					},
					{
						action = "lua LazyVim.pick.config_files()()",
						desc = " Config",
						icon = " ",
						key = "c",
					},
					{
						action = 'lua require("persistence").load()',
						desc = " Restore Session",
						icon = " ",
						key = "s",
					},
					{
						action = "LazyExtras",
						desc = " Lazy Extras",
						icon = " ",
						key = "x",
					},
					{
						action = "Lazy",
						desc = " Lazy",
						icon = "󰒲 ",
						key = "l",
					},
					{
						action = function()
							vim.api.nvim_input("<cmd>qa<cr>")
						end,
						desc = " Quit",
						icon = " ",
						key = "q",
					},
				},
				footer = function()
					local stats = require("lazy").stats()
					local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
					local footer = "⚡ Neovim loaded "
						.. stats.loaded
						.. "/"
						.. stats.count
						.. " plugins in "
						.. ms
						.. "ms"
					return { selected_quote.text, "", "- " .. selected_quote.author }
				end,
			},
		}

		for _, button in ipairs(opts.config.center) do
			button.desc = button.desc .. string.rep(" ", 43 - #button.desc)
			button.key_format = "  %s"
		end

		if vim.o.filetype == "lazy" then
			vim.cmd.close()
			vim.api.nvim_create_autocmd("User", {
				pattern = "DashboardLoaded",
				callback = function()
					require("lazy").show()
				end,
			})
		end

		return opts
	end,
}
