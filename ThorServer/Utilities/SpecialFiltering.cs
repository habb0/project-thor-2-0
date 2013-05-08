/*
Thor Server Project
Copyright 2008 Joe Hegarty


This file is part of The Thor Server Project.

The Thor Server Project is free software: you can redistribute it and/or modify
it under the terms of the GNU Affero General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

The Thor Server Project is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU Affero General Public License for more details.

You should have received a copy of the GNU Affero General Public License
along with The Thor Server Project.  If not, see <http://www.gnu.org/licenses/>.
*/

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;

namespace ThorServer.Utilities
{
    public static class SpecialFiltering
    {
        public static string FilterChars(string charList, string input)
        {
            string[] stripAt = charList.Split(',');

            foreach (string charToSplit in stripAt)
            {
                input = input.Replace(Convert.ToChar(int.Parse(charToSplit)).ToString(), "");
            }

            return input;
        }

        public static string FilterName(string input)
        {
            const string allowed = "1234567890qwertyuiopasdfghjklzxcvbnm-+=?!@:.,$";
            foreach (char character in input.ToLower())
            {
                if (!allowed.Contains(character))
                {
                    input = input.Replace(character.ToString(), "");
                }
            }

            return input;
        }

        public static string FilterOnlyNumbers(string input)
        {
            const string allowed = "1234567890";
            foreach (char character in input.ToLower())
            {
                if (!allowed.Contains(character))
                {
                    input = input.Replace(character.ToString(), "");
                }
            }

            return input;
        }

        public static bool CheckPoolFigure(string input)
        {
            Regex regex = new Regex("(^ch=s0[1-2]/(25[0-5]|2[0-4][0-9]|1[0-9][0-9]|[0-9][0-9]),(25[0-5]|2[0-4][0-9]|1[0-9][0-9]|[0-9][0-9]),(25[0-5]|2[0-4][0-9]|1[0-9][0-9]|[0-9][0-9])){1}$");
            Match match = regex.Match(input);
            return match.Success;
        }
    }
}
