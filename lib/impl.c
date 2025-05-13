#include "../tree-sitter/lib/include/tree_sitter/api.h"
#include "./gen/exports.h"

/*********/
/* Types */
/*********/

struct exports_moonbit_community_tree_sitter_types_language_t {
  const TSLanguage *language;
};

void exports_moonbit_community_tree_sitter_types_language_destructor(
    exports_moonbit_community_tree_sitter_types_language_t *rep) {
  if (rep != NULL) {
    ts_language_delete(rep->language);
  }
}

/**************************/
/* Section - Get language */
/**************************/
const TSLanguage *tree_sitter_json(void);

exports_moonbit_community_tree_sitter_types_own_language_t
exports_moonbit_community_tree_sitter_types_get_language(void) {
  const TSLanguage *json = tree_sitter_json();
  exports_moonbit_community_tree_sitter_types_language_t *language =
      malloc(sizeof(exports_moonbit_community_tree_sitter_types_language_t));
  language->language = tree_sitter_json();
  return exports_moonbit_community_tree_sitter_types_language_new(language);
}
