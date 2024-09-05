package cmd

import (
	"context"
	"github.com/urfave/cli/v3"
	"os"
)

func ReposCommand() *cli.Command {
	return &cli.Command{
		Name:      "repos",
		Usage:     "List Git repositories of a registry",
		HideHelp:  true,
		ArgsUsage: "registry [options]",
		Flags: []cli.Flag{&cli.StringFlag{
			Name: "jq-expression",
			// backtick is used as the name of the variable
			Usage: "Set the `JQ_EXPRESSION` used to parse the JSON API response ",
			Action: func(ctx context.Context, command *cli.Command, v string) error {
				if v == "" {
					return cli.Exit("jq expression should not be empty", 1)
				}
				return nil
			},
		}},
		Action: ReposAction(),
	}
}

func ReposAction() func(c context.Context, command *cli.Command) error {
	return func(c context.Context, command *cli.Command) error {

		if len(os.Args) <= 2 {
			message := "At least a option should be given"
			_ = cli.ShowSubcommandHelp(command)
			return cli.Exit(message, 1)
		}

		return nil
	}
}
