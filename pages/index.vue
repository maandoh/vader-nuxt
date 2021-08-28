<template>
  <div class="mx-auto p-5" style="max-width:1200px">
    <div>
      <img src="/vader-logo.svg" width="140"/>
      <div class="mb-3 text-xl text-gray-700 mt-1 font-semibold">
        Online sentiment analysis tool
      </div>

      <div class="text-gray-600 space-y-2">
        <div>
          This is an online demo of <a href="https://github.com/vaderSentiment/vaderSentiment-js">vaderSentiment-js</a>,
          Javascript port of <a href="https://github.com/cjhutto/vaderSentiment">VADER Sentiment Analysis tool.</a>
        </div>
        <div>
          VADER Sentiment Analysis. VADER (Valence Aware Dictionary and sEntiment Reasoner) is a lexicon and rule-based
          sentiment analysis tool that is specifically attuned to sentiments expressed in social media, and works well
          on texts from other domains.
        </div>
      </div>
    </div>

    <div class="bg-white rounded-xl shadow flex flex-col md:flex-row space-x-6 mt-5 p-5">
      <div class="w-full md:w-9/12">
          <textarea
            v-model="article"
            placeholder="Enter sentences here..."
            rows="7"
            class="bg-gray-100 p-5 w-full rounded-xl"
          ></textarea>
      </div>
      <div class="w-full md:w-3/12 ">
        <vader-table :vader-data="articleVaderData"></vader-table>
      </div>
    </div>

    <div v-if="sentences.length" class="mt-3 font-semibold text-gray-800 text-lg mt-10 mb-3">Breakdown by paragraph</div>

    <div class="space-y-5">
      <template v-for="sentence in sentences">
        <div class="bg-white rounded-xl shadow flex flex-col md:flex-row space-x-6 border-b p-5">
         <div class="w-full md:w-9/12">
            {{sentence}}
          </div>

          <div class="w-full md:w-3/12">
            <vader-table :vader-data="computeVader(sentence)"></vader-table>
          </div>

        </div>
      </template>
    </div>

    <div class="text-sm my-5 py-5 text-gray-700 border-t">
      Author: <a href="https://www.linkedin.com/in/jamesmawm">James Ma</a>
    </div>

  </div>
</template>

<script>
  import _ from 'lodash';

  export default {
    data() {
      return {
        article: 'The pos, neu, and neg scores are ratios for proportions of text that fall in each category (so these should all add up to be 1... or close to it with float operation). These are the most useful metrics if you want to analyze the context & presentation of how sentiment is conveyed or embedded in rhetoric for a given sentence. For example, different writing styles may embed strongly positive or negative sentiment within varying proportions of neutral text -- i.e., some writing styles may reflect a penchant for strongly flavored rhetoric, whereas other styles may use a great deal of neutral text while still conveying a similar overall (compound) sentiment. As another example: researchers analyzing information presentation in journalistic or editorical news might desire to establish whether the proportions of text (associated with a topic or named entity, for example) are balanced with similar amounts of positively and negatively framed text versus being "biased" towards one polarity or the other for the topic/entity.\nIt is also useful for researchers who would like to set standardized thresholds for classifying sentences as either positive, neutral, or negative. Typical threshold values (used in the literature cited on this page) are:',
        // article: '',
        articleVaderData: {},
      }
    },
    computed: {
      sentences() {
        const newSentences = [];
        let nlCounter = 0;
        let currentSentence = '';
        this.article.split('\n').map(sent => {
          if (_.isEmpty(sent)) {
            if (!_.isEmpty(currentSentence)) {
              newSentences.push(currentSentence);
            }

            nlCounter++;
            currentSentence = '';
            return;
          }

          currentSentence = [currentSentence, sent].join(' ');
        });

        if (!_.isEmpty(currentSentence)) {
          newSentences.push(currentSentence);
        }

        return newSentences;
      },
    },
    watch: {
      article() {
        this.compute();
      },
    },
    methods: {
      compute() {
        this.articleVaderData = this.computeVader(this.article);
      },
      computeVader(text) {
        return this.$vader.SentimentIntensityAnalyzer.polarity_scores(text);
      },
    },
  }
</script>
<style>
  body {
    @apply bg-gray-100;
  }

  a {
    @apply text-blue-500 cursor-pointer;
  }
</style>
