x <- scan("02-05-chronological-order-plates.xml", what="char", sep = "\n")
vindplaats <- unlist(regmatches(x, gregexpr("<name\\>[^<]+?<\\/name>", x, perl = TRUE)))
vindplaats

periods <- gregexpr('(?<=period\\=")[^"]+(?="\\>)', vindplaats, perl = TRUE)
periods <- unlist(regmatches(vindplaats, periods))
periods

nummers <- gregexpr('(?<=xml\\:id\\=")[^"]+(?="\\s)', vindplaats, perl = TRUE)
nummers <- unlist(regmatches(vindplaats, nummers))
nummers

vindplaats1 <- gsub("(<name[^>]+?\\>|<\\/name\\>)", "", vindplaats, perl = TRUE)

ob <- data.frame(nummers, vindplaats1, caka = periods)